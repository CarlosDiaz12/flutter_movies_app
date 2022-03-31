// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class GuestSessionInfo {
  String guest_session_id;
  String expires_at;
  GuestSessionInfo({
    required this.guest_session_id,
    required this.expires_at,
  });

  GuestSessionInfo copyWith({
    String? guest_session_id,
    String? expires_at,
  }) {
    return GuestSessionInfo(
      guest_session_id: guest_session_id ?? this.guest_session_id,
      expires_at: expires_at ?? this.expires_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'guest_session_id': guest_session_id});
    result.addAll({'expires_at': expires_at});

    return result;
  }

  factory GuestSessionInfo.fromMap(Map<String, dynamic> map) {
    return GuestSessionInfo(
      guest_session_id: map['guest_session_id'] ?? '',
      expires_at: map['expires_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GuestSessionInfo.fromJson(String source) =>
      GuestSessionInfo.fromMap(json.decode(source));

  @override
  String toString() =>
      'GuestSessionInfo(guest_session_id: $guest_session_id, expires_at: $expires_at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GuestSessionInfo &&
        other.guest_session_id == guest_session_id &&
        other.expires_at == expires_at;
  }

  @override
  int get hashCode => guest_session_id.hashCode ^ expires_at.hashCode;
}
