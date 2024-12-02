import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:bumitama_movie/models/movie_feed_model/components/movie_feed.dart';

class FavoriteModel {
  int? page;
  List<MovieFeed>? results;
  int? totalPages;
  int? totalResults;

  FavoriteModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  FavoriteModel copyWith({
    int? page,
    List<MovieFeed>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return FavoriteModel(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'results': results?.map((x) => x.toMap()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      page: map['page'] != null ? map['page'] as int : null,
      results: map['results'] != null
          ? List<MovieFeed>.from(
              (map['results'] as List<dynamic>).map<MovieFeed?>(
                (x) => MovieFeed.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      totalPages: map['total_pages'] != null ? map['total_pages'] as int : null,
      totalResults:
          map['total_results'] != null ? map['total_results'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteModel.fromJson(String source) =>
      FavoriteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FavoriteModel(page: $page, results: $results, total_pages: $totalPages, total_results: $totalResults)';
  }

  @override
  bool operator ==(covariant FavoriteModel other) {
    if (identical(this, other)) return true;

    return other.page == page &&
        listEquals(other.results, results) &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        results.hashCode ^
        totalPages.hashCode ^
        totalResults.hashCode;
  }
}
