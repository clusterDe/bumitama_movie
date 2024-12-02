import 'dart:io';

import 'package:bumitama_movie/models/favorite/favorite_model.dart';
import 'package:bumitama_movie/models/movie_feed_model/components/movie_feed.dart';
import 'package:bumitama_movie/repository/api/api_repository.dart';
import 'package:http/http.dart' as http;

class FavoriteRepository {
  Future<List<MovieFeed>?> fetchFavorite({required int page}) async {
    var url = Uri.parse(
      '$baseUrl/3/account/$accountId/favorite/movies?page=$page&sort_by=created_at.asc',
    );

    var response = await http.get(
      url,
      headers: header,
    );

    if (response.statusCode == 200) {
      var result = FavoriteModel.fromJson(response.body);

      return result.results;
    } else {
      throw const HttpException('Failed to load favorite');
    }
  }
}
