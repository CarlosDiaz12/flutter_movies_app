// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class RateMovieRespose {
  final int status_code;
  final String status_message;
  RateMovieRespose({
    required this.status_code,
    required this.status_message,
  });

  RateMovieRespose copyWith({
    int? status_code,
    String? status_message,
  }) {
    return RateMovieRespose(
      status_code: status_code ?? this.status_code,
      status_message: status_message ?? this.status_message,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'status_code': status_code});
    result.addAll({'status_message': status_message});

    return result;
  }

  factory RateMovieRespose.fromMap(Map<String, dynamic> map) {
    return RateMovieRespose(
      status_code: map['status_code']?.toInt() ?? 0,
      status_message: map['status_message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RateMovieRespose.fromJson(String source) =>
      RateMovieRespose.fromMap(json.decode(source));

  @override
  String toString() =>
      'RateMovieRespose(status_code: $status_code, status_message: $status_message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RateMovieRespose &&
        other.status_code == status_code &&
        other.status_message == status_message;
  }

  @override
  int get hashCode => status_code.hashCode ^ status_message.hashCode;
}
