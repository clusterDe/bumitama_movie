import 'dart:io';

import 'package:bumitama_movie/models/movie_keyword_model/movie_keyword_model.dart';
import 'package:bumitama_movie/repository/api/api_repository.dart';
import 'package:http/http.dart' as http;

class MovieKeywordRepository {
  Future<MovieKeywordModel> fetchMovieKeyword({
    required String movieId,
  }) async {
    var url = Uri.parse('$baseUrl/3/movie/$movieId/keywords');

    var response = await http.get(
      url,
      headers: header,
    );

    if (response.statusCode == 200) {
      var result = MovieKeywordModel.fromJson(response.body);
      return result;
    } else {
      throw const HttpException('Failed to load keyword');
    }
  }
}
