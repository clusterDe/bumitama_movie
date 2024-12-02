import 'dart:io';

import 'package:bumitama_movie/models/search_model/search_model.dart';
import 'package:bumitama_movie/repository/api/api_repository.dart';
import 'package:http/http.dart' as http;

import '../../models/movie_feed_model/components/movie_feed.dart';

class SearchRepository {
  Future<List<MovieFeed>?> fetchSearchQuery(
      {required String query, int? page}) async {
    var url = Uri.parse(
      '$baseUrl/3/search/movie?query=$query&include_adult=true&page=$page',
    );

    var response = await http.get(
      url,
      headers: header,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var result = SearchModel.fromJson(response.body);
      return result.results;
    } else {
      throw const HttpException('Failed to search');
    }
  }
}
