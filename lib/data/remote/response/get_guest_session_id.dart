// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class GetGuestSessionIdResponse {
  bool success;
  String guest_session_id;
  String expires_at;
  GetGuestSessionIdResponse({
    required this.success,
    required this.guest_session_id,
    required this.expires_at,
  });

  GetGuestSessionIdResponse copyWith({
    bool? success,
    String? guest_session_id,
    String? expires_at,
  }) {
    return GetGuestSessionIdResponse(
      success: success ?? this.success,
      guest_session_id: guest_session_id ?? this.guest_session_id,
      expires_at: expires_at ?? this.expires_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'success': success});
    result.addAll({'guest_session_id': guest_session_id});
    result.addAll({'expires_at': expires_at});

    return result;
  }

  factory GetGuestSessionIdResponse.fromMap(Map<String, dynamic> map) {
    return GetGuestSessionIdResponse(
      success: map['success'] ?? false,
      guest_session_id: map['guest_session_id'] ?? '',
      expires_at: map['expires_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GetGuestSessionIdResponse.fromJson(String source) =>
      GetGuestSessionIdResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'GetGuestSessionIdResponse(success: $success, guest_session_id: $guest_session_id, expires_at: $expires_at)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetGuestSessionIdResponse &&
        other.success == success &&
        other.guest_session_id == guest_session_id &&
        other.expires_at == expires_at;
  }

  @override
  int get hashCode =>
      success.hashCode ^ guest_session_id.hashCode ^ expires_at.hashCode;
}
