import 'dart:convert';

class RateMovieRequest {
  final double value;
  RateMovieRequest({
    required this.value,
  });

  RateMovieRequest copyWith({
    double? value,
  }) {
    return RateMovieRequest(
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'value': value});

    return result;
  }

  factory RateMovieRequest.fromMap(Map<String, dynamic> map) {
    return RateMovieRequest(
      value: map['value']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RateMovieRequest.fromJson(String source) =>
      RateMovieRequest.fromMap(json.decode(source));

  @override
  String toString() => 'RateMovieRequest(value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RateMovieRequest && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
