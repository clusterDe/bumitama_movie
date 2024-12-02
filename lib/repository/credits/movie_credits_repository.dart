import 'dart:io';

import 'package:bumitama_movie/models/movie_credits_model/movie_credits_model.dart';
import 'package:bumitama_movie/repository/api/api_repository.dart';
import 'package:http/http.dart' as http;

class MovieCreditsRepository {
  Future<MovieCreditsModel> fetchMovieCredit({
    required String movieDetailId,
  }) async {
    var url = Uri.parse('$baseUrl/3/movie/$movieDetailId/credits');

    var response = await http.get(
      url,
      headers: header,
    );

    if (response.statusCode == 200) {
      var result = MovieCreditsModel.fromJson(response.body);

      return result;
    } else {
      throw const HttpException('Failed to load credits');
    }
  }
}
