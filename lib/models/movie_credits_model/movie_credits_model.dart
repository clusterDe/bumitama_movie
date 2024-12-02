import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'components/cast.dart';

class MovieCreditsModel {
  int? id;
  List<Cast>? cast;
  List<Cast>? crew;

  MovieCreditsModel({
    this.id,
    this.cast,
    this.crew,
  });

  MovieCreditsModel copyWith({
    int? id,
    List<Cast>? cast,
    List<Cast>? crew,
  }) {
    return MovieCreditsModel(
      id: id ?? this.id,
      cast: cast ?? this.cast,
      crew: crew ?? this.crew,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cast': cast?.map((x) => x.toMap()).toList(),
      'crew': crew?.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieCreditsModel.fromMap(Map<String, dynamic> map) {
    return MovieCreditsModel(
      id: map['id'] != null ? map['id'] as int : null,
      cast: map['cast'] != null
          ? List<Cast>.from(
              (map['cast'] as List<dynamic>).map<Cast?>(
                (x) => Cast.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      crew: map['crew'] != null
          ? List<Cast>.from(
              (map['crew'] as List<dynamic>).map<Cast?>(
                (x) => Cast.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieCreditsModel.fromJson(String source) =>
      MovieCreditsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MovieCreditsModel(id: $id, cast: $cast, crew: $crew)';

  @override
  bool operator ==(covariant MovieCreditsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.cast, cast) &&
        listEquals(other.crew, crew);
  }

  @override
  int get hashCode => id.hashCode ^ cast.hashCode ^ crew.hashCode;
}
