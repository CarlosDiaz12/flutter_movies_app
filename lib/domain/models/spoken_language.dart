// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class SpokenLanguage {
  String? english_name;
  String? iso_639_1;
  String? name;
  SpokenLanguage({
    this.english_name,
    this.iso_639_1,
    this.name,
  });

  SpokenLanguage copyWith({
    String? english_name,
    String? iso_639_1,
    String? name,
  }) {
    return SpokenLanguage(
      english_name: english_name ?? this.english_name,
      iso_639_1: iso_639_1 ?? this.iso_639_1,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (english_name != null) {
      result.addAll({'english_name': english_name});
    }
    if (iso_639_1 != null) {
      result.addAll({'iso_639_1': iso_639_1});
    }
    if (name != null) {
      result.addAll({'name': name});
    }

    return result;
  }

  factory SpokenLanguage.fromMap(Map<String, dynamic> map) {
    return SpokenLanguage(
      english_name: map['english_name'],
      iso_639_1: map['iso_639_1'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpokenLanguage.fromJson(String source) =>
      SpokenLanguage.fromMap(json.decode(source));

  @override
  String toString() =>
      'SpokenLanguage(english_name: $english_name, iso_639_1: $iso_639_1, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpokenLanguage &&
        other.english_name == english_name &&
        other.iso_639_1 == iso_639_1 &&
        other.name == name;
  }

  @override
  int get hashCode =>
      english_name.hashCode ^ iso_639_1.hashCode ^ name.hashCode;
}
