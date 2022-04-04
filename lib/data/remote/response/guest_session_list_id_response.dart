import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class GuestSessionListIdResponse {
  String status_message;
  bool success;
  int status_code;
  int list_id;
  GuestSessionListIdResponse({
    required this.status_message,
    required this.success,
    required this.status_code,
    required this.list_id,
  });

  GuestSessionListIdResponse copyWith({
    String? status_message,
    bool? success,
    int? status_code,
    int? list_id,
  }) {
    return GuestSessionListIdResponse(
      status_message: status_message ?? this.status_message,
      success: success ?? this.success,
      status_code: status_code ?? this.status_code,
      list_id: list_id ?? this.list_id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'status_message': status_message});
    result.addAll({'success': success});
    result.addAll({'status_code': status_code});
    result.addAll({'list_id': list_id});

    return result;
  }

  factory GuestSessionListIdResponse.fromMap(Map<String, dynamic> map) {
    return GuestSessionListIdResponse(
      status_message: map['status_message'] ?? '',
      success: map['success'] ?? false,
      status_code: map['status_code']?.toInt() ?? 0,
      list_id: map['list_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory GuestSessionListIdResponse.fromJson(String source) =>
      GuestSessionListIdResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GuestSessionListIdResponse(status_message: $status_message, success: $success, status_code: $status_code, list_id: $list_id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GuestSessionListIdResponse &&
        other.status_message == status_message &&
        other.success == success &&
        other.status_code == status_code &&
        other.list_id == list_id;
  }

  @override
  int get hashCode {
    return status_message.hashCode ^
        success.hashCode ^
        status_code.hashCode ^
        list_id.hashCode;
  }
}
