import 'dart:convert';
// ignore_for_file: non_constant_identifier_names

class MovieCast {
  List<Cast>? cast;
  MovieCast({this.cast});
}

class Cast {
  bool? adult;
  int? gender;
  int? id;
  String? known_for_department;
  String? name;
  String? original_name;
  double? popularity;
  String? profile_path;
  int? cast_id;
  String? character;
  String? credit_id;
  int? order;
  Cast({
    this.adult,
    this.gender,
    this.id,
    this.known_for_department,
    this.name,
    this.original_name,
    this.popularity,
    this.profile_path,
    this.cast_id,
    this.character,
    this.credit_id,
    this.order,
  });

  Cast copyWith({
    bool? adult,
    int? gender,
    int? id,
    String? known_for_department,
    String? name,
    String? original_name,
    double? popularity,
    String? profile_path,
    int? cast_id,
    String? character,
    String? credit_id,
    int? order,
  }) {
    return Cast(
      adult: adult ?? this.adult,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      known_for_department: known_for_department ?? this.known_for_department,
      name: name ?? this.name,
      original_name: original_name ?? this.original_name,
      popularity: popularity ?? this.popularity,
      profile_path: profile_path ?? this.profile_path,
      cast_id: cast_id ?? this.cast_id,
      character: character ?? this.character,
      credit_id: credit_id ?? this.credit_id,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (adult != null) {
      result.addAll({'adult': adult});
    }
    if (gender != null) {
      result.addAll({'gender': gender});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (known_for_department != null) {
      result.addAll({'known_for_department': known_for_department});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (original_name != null) {
      result.addAll({'original_name': original_name});
    }
    if (popularity != null) {
      result.addAll({'popularity': popularity});
    }
    if (profile_path != null) {
      result.addAll({'profile_path': profile_path});
    }
    if (cast_id != null) {
      result.addAll({'cast_id': cast_id});
    }
    if (character != null) {
      result.addAll({'character': character});
    }
    if (credit_id != null) {
      result.addAll({'credit_id': credit_id});
    }
    if (order != null) {
      result.addAll({'order': order});
    }

    return result;
  }

  factory Cast.fromMap(Map<String, dynamic> map) {
    return Cast(
      adult: map['adult'],
      gender: map['gender']?.toInt(),
      id: map['id']?.toInt(),
      known_for_department: map['known_for_department'],
      name: map['name'],
      original_name: map['original_name'],
      popularity: map['popularity']?.toDouble(),
      profile_path: map['profile_path'],
      cast_id: map['cast_id']?.toInt(),
      character: map['character'],
      credit_id: map['credit_id'],
      order: map['order']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cast.fromJson(String source) => Cast.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cast(adult: $adult, gender: $gender, id: $id, known_for_department: $known_for_department, name: $name, original_name: $original_name, popularity: $popularity, profile_path: $profile_path, cast_id: $cast_id, character: $character, credit_id: $credit_id, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cast &&
        other.adult == adult &&
        other.gender == gender &&
        other.id == id &&
        other.known_for_department == known_for_department &&
        other.name == name &&
        other.original_name == original_name &&
        other.popularity == popularity &&
        other.profile_path == profile_path &&
        other.cast_id == cast_id &&
        other.character == character &&
        other.credit_id == credit_id &&
        other.order == order;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        gender.hashCode ^
        id.hashCode ^
        known_for_department.hashCode ^
        name.hashCode ^
        original_name.hashCode ^
        popularity.hashCode ^
        profile_path.hashCode ^
        cast_id.hashCode ^
        character.hashCode ^
        credit_id.hashCode ^
        order.hashCode;
  }
}
