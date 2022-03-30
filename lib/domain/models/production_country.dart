import 'dart:convert';

class ProductionCountry {
  String? iso_3166_1;
  String? name;
  ProductionCountry({
    this.iso_3166_1,
    this.name,
  });

  ProductionCountry copyWith({
    String? iso_3166_1,
    String? name,
  }) {
    return ProductionCountry(
      iso_3166_1: iso_3166_1 ?? this.iso_3166_1,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (iso_3166_1 != null) {
      result.addAll({'iso_3166_1': iso_3166_1});
    }
    if (name != null) {
      result.addAll({'name': name});
    }

    return result;
  }

  factory ProductionCountry.fromMap(Map<String, dynamic> map) {
    return ProductionCountry(
      iso_3166_1: map['iso_3166_1'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCountry.fromJson(String source) =>
      ProductionCountry.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductionCountries(iso_3166_1: $iso_3166_1, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductionCountry &&
        other.iso_3166_1 == iso_3166_1 &&
        other.name == name;
  }

  @override
  int get hashCode => iso_3166_1.hashCode ^ name.hashCode;
}
