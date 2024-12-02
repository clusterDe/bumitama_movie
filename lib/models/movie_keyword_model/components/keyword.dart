import 'dart:convert';

class Keyword {
  int? id;
  String? name;

  Keyword({
    this.id,
    this.name,
  });

  Keyword copyWith({
    int? id,
    String? name,
  }) {
    return Keyword(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Keyword.fromMap(Map<String, dynamic> map) {
    return Keyword(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Keyword.fromJson(String source) =>
      Keyword.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Keyword(id: $id, name: $name)';

  @override
  bool operator ==(covariant Keyword other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
