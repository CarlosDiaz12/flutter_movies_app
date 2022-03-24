import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_movies_app/domain/models/movie.dart';

class ListMoviesResponse {
  final List<Movie> results;

  ListMoviesResponse({
    required this.results,
  });

  ListMoviesResponse copyWith({
    List<Movie>? results,
  }) {
    return ListMoviesResponse(
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'results': results.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ListMoviesResponse.fromMap(Map<String, dynamic> map) {
    return ListMoviesResponse(
      results: List<Movie>.from(map['results']?.map((x) => Movie.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListMoviesResponse.fromJson(String source) =>
      ListMoviesResponse.fromMap(json.decode(source));

  @override
  String toString() => 'ListMoviesResponse(results: $results)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListMoviesResponse && listEquals(other.results, results);
  }

  @override
  int get hashCode => results.hashCode;
}
