// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DatesModel {
  String? maximum;
  String? minimum;

  DatesModel({
    this.maximum,
    this.minimum,
  });

  DatesModel copyWith({
    String? maximum,
    String? minimum,
  }) {
    return DatesModel(
      maximum: maximum ?? this.maximum,
      minimum: minimum ?? this.minimum,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maximum': maximum,
      'minimum': minimum,
    };
  }

  factory DatesModel.fromMap(Map<String, dynamic> map) {
    return DatesModel(
      maximum: map['maximum'] != null ? map['maximum'] as String : null,
      minimum: map['minimum'] != null ? map['minimum'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DatesModel.fromJson(String source) =>
      DatesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DatesModel(maximum: $maximum, minimum: $minimum)';

  @override
  bool operator ==(covariant DatesModel other) {
    if (identical(this, other)) return true;

    return other.maximum == maximum && other.minimum == minimum;
  }

  @override
  int get hashCode => maximum.hashCode ^ minimum.hashCode;
}
