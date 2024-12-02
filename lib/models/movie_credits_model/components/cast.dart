import 'dart:convert';

class Cast {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;
  String? department;
  String? job;

  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  Cast copyWith({
    bool? adult,
    int? gender,
    int? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    double? popularity,
    String? profilePath,
    int? castId,
    String? character,
    String? creditId,
    int? order,
    String? department,
    String? job,
  }) {
    return Cast(
      adult: adult ?? this.adult,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      knownForDepartment: knownForDepartment ?? this.knownForDepartment,
      name: name ?? this.name,
      originalName: originalName ?? this.originalName,
      popularity: popularity ?? this.popularity,
      profilePath: profilePath ?? this.profilePath,
      castId: castId ?? this.castId,
      character: character ?? this.character,
      creditId: creditId ?? this.creditId,
      order: order ?? this.order,
      department: department ?? this.department,
      job: job ?? this.job,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for_department': knownForDepartment,
      'name': name,
      'original_name': originalName,
      'popularity': popularity,
      'profile_path': profilePath,
      'cast_id': castId,
      'character': character,
      'credit_id': creditId,
      'order': order,
      'department': department,
      'job': job,
    };
  }

  factory Cast.fromMap(Map<String, dynamic> map) {
    return Cast(
      adult: map['adult'] != null ? map['adult'] as bool : null,
      gender: map['gender'] != null ? map['gender'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      knownForDepartment: map['known_for_department'] != null
          ? map['known_for_department'] as String
          : null,
      name: map['name'] != null ? map['name'] as String : null,
      originalName:
          map['original_name'] != null ? map['original_name'] as String : null,
      popularity:
          map['popularity'] != null ? map['popularity'] as double : null,
      profilePath:
          map['profile_path'] != null ? map['profile_path'] as String : null,
      castId: map['cast_id'] != null ? map['cast_id'] as int : null,
      character: map['character'] != null ? map['character'] as String : null,
      creditId: map['credit_id'] != null ? map['credit_id'] as String : null,
      order: map['order'] != null ? map['order'] as int : null,
      department:
          map['department'] != null ? map['department'] as String : null,
      job: map['job'] != null ? map['job'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cast.fromJson(String source) =>
      Cast.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cast(adult: $adult, gender: $gender, id: $id, known_for_department: $knownForDepartment, name: $name, original_name: $originalName, popularity: $popularity, profile_path: $profilePath, cast_id: $castId, character: $character, credit_id: $creditId, order: $order, department: $department, job: $job)';
  }

  @override
  bool operator ==(covariant Cast other) {
    if (identical(this, other)) return true;

    return other.adult == adult &&
        other.gender == gender &&
        other.id == id &&
        other.knownForDepartment == knownForDepartment &&
        other.name == name &&
        other.originalName == originalName &&
        other.popularity == popularity &&
        other.profilePath == profilePath &&
        other.castId == castId &&
        other.character == character &&
        other.creditId == creditId &&
        other.order == order &&
        other.department == department &&
        other.job == job;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        gender.hashCode ^
        id.hashCode ^
        knownForDepartment.hashCode ^
        name.hashCode ^
        originalName.hashCode ^
        popularity.hashCode ^
        profilePath.hashCode ^
        castId.hashCode ^
        character.hashCode ^
        creditId.hashCode ^
        order.hashCode ^
        department.hashCode ^
        job.hashCode;
  }
}
