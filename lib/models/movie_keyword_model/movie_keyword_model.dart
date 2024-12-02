import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'components/keyword.dart';

class MovieKeywordModel {
  int? id;
  List<Keyword>? keywords;

  MovieKeywordModel({
    this.id,
    this.keywords,
  });

  MovieKeywordModel copyWith({
    int? id,
    List<Keyword>? keywords,
  }) {
    return MovieKeywordModel(
      id: id ?? this.id,
      keywords: keywords ?? this.keywords,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'keywords': keywords?.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieKeywordModel.fromMap(Map<String, dynamic> map) {
    return MovieKeywordModel(
      id: map['id'] != null ? map['id'] as int : null,
      keywords: map['keywords'] != null
          ? List<Keyword>.from(
              (map['keywords'] as List<dynamic>).map<Keyword?>(
                (x) => Keyword.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieKeywordModel.fromJson(String source) =>
      MovieKeywordModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MovieKeywordModel(id: $id, keywords: $keywords)';

  @override
  bool operator ==(covariant MovieKeywordModel other) {
    if (identical(this, other)) return true;

    return other.id == id && listEquals(other.keywords, keywords);
  }

  @override
  int get hashCode => id.hashCode ^ keywords.hashCode;
}
