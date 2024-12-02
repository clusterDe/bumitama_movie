// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:bumitama_movie/models/dates_model.dart';
import 'package:bumitama_movie/models/movie_feed_model/components/movie_feed.dart';

class DataMovie {
  DatesModel? dates;
  int? page;
  List<MovieFeed>? results;
  int? totalPages;
  int? totalResults;

  DataMovie({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  DataMovie copyWith({
    DatesModel? dates,
    int? page,
    List<MovieFeed>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return DataMovie(
      dates: dates ?? this.dates,
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dates': dates?.toMap(),
      'page': page,
      'results': results?.map((x) => x.toMap()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory DataMovie.fromMap(Map<String, dynamic> map) {
    return DataMovie(
      dates: map['dates'] != null
          ? DatesModel.fromMap(map['dates'] as Map<String, dynamic>)
          : null,
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

  factory DataMovie.fromJson(String source) =>
      DataMovie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DataMovie(dates: $dates, page: $page, results: $results, total_pages: $totalPages, total_results: $totalResults)';
  }

  @override
  bool operator ==(covariant DataMovie other) {
    if (identical(this, other)) return true;

    return other.dates == dates &&
        other.page == page &&
        listEquals(other.results, results) &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return dates.hashCode ^
        page.hashCode ^
        results.hashCode ^
        totalPages.hashCode ^
        totalResults.hashCode;
  }
}
