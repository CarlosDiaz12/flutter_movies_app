// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class ProductionCompany {
  int? id;
  String? logo_path;
  String? name;
  String? origin_country;
  ProductionCompany({
    this.id,
    this.logo_path,
    this.name,
    this.origin_country,
  });

  ProductionCompany copyWith({
    int? id,
    String? logo_path,
    String? name,
    String? origin_country,
  }) {
    return ProductionCompany(
      id: id ?? this.id,
      logo_path: logo_path ?? this.logo_path,
      name: name ?? this.name,
      origin_country: origin_country ?? this.origin_country,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (logo_path != null) {
      result.addAll({'logo_path': logo_path});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (origin_country != null) {
      result.addAll({'origin_country': origin_country});
    }

    return result;
  }

  factory ProductionCompany.fromMap(Map<String, dynamic> map) {
    return ProductionCompany(
      id: map['id']?.toInt(),
      logo_path: map['logo_path'],
      name: map['name'],
      origin_country: map['origin_country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCompany.fromJson(String source) =>
      ProductionCompany.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductionCompany(id: $id, logo_path: $logo_path, name: $name, origin_country: $origin_country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductionCompany &&
        other.id == id &&
        other.logo_path == logo_path &&
        other.name == name &&
        other.origin_country == origin_country;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        logo_path.hashCode ^
        name.hashCode ^
        origin_country.hashCode;
  }
}
