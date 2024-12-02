import 'dart:convert';

class BelongsToCollection {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  BelongsToCollection copyWith({
    int? id,
    String? name,
    String? posterPath,
    String? backdropPath,
  }) {
    return BelongsToCollection(
      id: id ?? this.id,
      name: name ?? this.name,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
    };
  }

  factory BelongsToCollection.fromMap(Map<String, dynamic> map) {
    return BelongsToCollection(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      posterPath:
          map['poster_path'] != null ? map['poster_path'] as String : null,
      backdropPath:
          map['backdrop_path'] != null ? map['backdrop_path'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BelongsToCollection.fromJson(String source) =>
      BelongsToCollection.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BelongsToCollection(id: $id, name: $name, poster_path: $posterPath, backdrop_path: $backdropPath)';
  }

  @override
  bool operator ==(covariant BelongsToCollection other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.posterPath == posterPath &&
        other.backdropPath == backdropPath;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        posterPath.hashCode ^
        backdropPath.hashCode;
  }
}
