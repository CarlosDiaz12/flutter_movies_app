// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class GuestSessionListInfo {
  int? list_id;
  GuestSessionListInfo({
    this.list_id,
  });

  GuestSessionListInfo copyWith({
    int? list_id,
  }) {
    return GuestSessionListInfo(
      list_id: list_id ?? this.list_id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (list_id != null) {
      result.addAll({'list_id': list_id});
    }

    return result;
  }

  factory GuestSessionListInfo.fromMap(Map<String, dynamic> map) {
    return GuestSessionListInfo(
      list_id: map['list_id']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory GuestSessionListInfo.fromJson(String source) =>
      GuestSessionListInfo.fromMap(json.decode(source));

  @override
  String toString() => 'GuestSessionListInfo(list_id: $list_id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GuestSessionListInfo && other.list_id == list_id;
  }

  @override
  int get hashCode => list_id.hashCode;
}
