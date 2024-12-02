import 'dart:io';

import 'package:bumitama_movie/repository/api/api_repository.dart';
import 'package:http/http.dart' as http;

import '../../models/movie_feed_model/data_movie.dart';
import '../../models/movie_feed_model/components/movie_feed.dart';

class UpcomingRepository {
  Future<List<MovieFeed>?> fetchUpcoming({required int page}) async {
    var url = Uri.parse('$baseUrl/3/movie/upcoming?page=$page');

    var response = await http.get(
      url,
      headers: header,
    );

    if (response.statusCode == 200) {
      var dataMovie = DataMovie.fromJson(response.body);

      return dataMovie.results;
    } else {
      throw const HttpException('Failed to load movies');
    }
  }
}
