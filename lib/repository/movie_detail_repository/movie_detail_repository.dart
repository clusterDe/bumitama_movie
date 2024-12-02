import 'dart:io';

import 'package:bumitama_movie/models/movie_detail_model/movie_detail_model.dart';
import 'package:bumitama_movie/repository/api/api_repository.dart';
import 'package:http/http.dart' as http;

class MovieDetailRepository {
  Future<MovieDetailModel> fetchMovieDetail({
    required String movieDetailId,
  }) async {
    var url = Uri.parse('$baseUrl/3/movie/$movieDetailId');

    var response = await http.get(
      url,
      headers: header,
    );

    if (response.statusCode == 200) {
      var result = MovieDetailModel.fromJson(response.body);

      return result;
    } else {
      throw const HttpException('Failed to load movie detail');
    }
  }
}
