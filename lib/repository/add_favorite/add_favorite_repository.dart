import 'dart:io';

import 'package:bumitama_movie/models/add_favorite_model/add_favorite_model.dart';
import 'package:bumitama_movie/repository/api/api_repository.dart';
import 'package:http/http.dart' as http;

class AddFavoriteRepository {
  Future<AddFavoriteModel> fetchAddRepository({
    required String mediaType,
    required int mediaId,
    required bool favorite,
  }) async {
    var url = Uri.parse('$baseUrl/3/account/$accountId/favorite');

    var bodyPost = {
      'media_type': mediaType,
      'media_id': '$mediaId',
      'favorite': '$favorite',
    };

    var response = await http.post(
      url,
      headers: header,
      body: bodyPost,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      var result = AddFavoriteModel.fromJson(response.body);
      return result;
    } else {
      throw const HttpException('Failed to request add favorite');
    }
  }
}
