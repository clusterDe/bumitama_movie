import 'dart:convert';

class ProductionCountry {
  String? iso31661;
  String? name;

  ProductionCountry({
    this.iso31661,
    this.name,
  });

  ProductionCountry copyWith({
    String? iso31661,
    String? name,
  }) {
    return ProductionCountry(
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso_3166_1': iso31661,
      'name': name,
    };
  }

  factory ProductionCountry.fromMap(Map<String, dynamic> map) {
    return ProductionCountry(
      iso31661: map['iso_3166_1'] != null ? map['iso_3166_1'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCountry.fromJson(String source) =>
      ProductionCountry.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductionCountry(iso_3166_1: $iso31661, name: $name)';

  @override
  bool operator ==(covariant ProductionCountry other) {
    if (identical(this, other)) return true;

    return other.iso31661 == iso31661 && other.name == name;
  }

  @override
  int get hashCode => iso31661.hashCode ^ name.hashCode;
}
