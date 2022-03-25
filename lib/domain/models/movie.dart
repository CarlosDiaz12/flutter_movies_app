// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

class Movie {
  String? poster_path;
  bool? adult;
  String? overview;
  String? release_date;
  List<int>? genre_ids;
  int? id;
  String? original_title;
  String? original_language;
  String? title;
  String? backdrop_path;
  double? popularity;
  int? vote_count;
  bool? video;
  double? vote_average;
  Movie({
    this.poster_path,
    this.adult,
    this.overview,
    this.release_date,
    this.genre_ids,
    this.id,
    this.original_title,
    this.original_language,
    this.title,
    this.backdrop_path,
    this.popularity,
    this.vote_count,
    this.video,
    this.vote_average,
  });

  Movie copyWith({
    String? poster_path,
    bool? adult,
    String? overview,
    String? release_date,
    List<int>? genre_ids,
    int? id,
    String? original_title,
    String? original_language,
    String? title,
    String? backdrop_path,
    double? popularity,
    int? vote_count,
    bool? video,
    double? vote_average,
  }) {
    return Movie(
      poster_path: poster_path ?? this.poster_path,
      adult: adult ?? this.adult,
      overview: overview ?? this.overview,
      release_date: release_date ?? this.release_date,
      genre_ids: genre_ids ?? this.genre_ids,
      id: id ?? this.id,
      original_title: original_title ?? this.original_title,
      original_language: original_language ?? this.original_language,
      title: title ?? this.title,
      backdrop_path: backdrop_path ?? this.backdrop_path,
      popularity: popularity ?? this.popularity,
      vote_count: vote_count ?? this.vote_count,
      video: video ?? this.video,
      vote_average: vote_average ?? this.vote_average,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (poster_path != null) {
      result.addAll({'poster_path': poster_path});
    }
    if (adult != null) {
      result.addAll({'adult': adult});
    }
    if (overview != null) {
      result.addAll({'overview': overview});
    }
    if (release_date != null) {
      result.addAll({'release_date': release_date});
    }
    if (genre_ids != null) {
      result.addAll({'genre_ids': genre_ids});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (original_title != null) {
      result.addAll({'original_title': original_title});
    }
    if (original_language != null) {
      result.addAll({'original_language': original_language});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (backdrop_path != null) {
      result.addAll({'backdrop_path': backdrop_path});
    }
    if (popularity != null) {
      result.addAll({'popularity': popularity});
    }
    if (vote_count != null) {
      result.addAll({'vote_count': vote_count});
    }
    if (video != null) {
      result.addAll({'video': video});
    }
    if (vote_average != null) {
      result.addAll({'vote_average': vote_average});
    }

    return result;
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      poster_path: map['poster_path'],
      adult: map['adult'],
      overview: map['overview'],
      release_date: map['release_date'],
      genre_ids: List<int>.from(map['genre_ids']),
      id: map['id']?.toInt(),
      original_title: map['original_title'],
      original_language: map['original_language'],
      title: map['title'],
      backdrop_path: map['backdrop_path'],
      popularity: map['popularity']?.toDouble(),
      vote_count: map['vote_count']?.toInt(),
      video: map['video'],
      vote_average: map['vote_average']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Movie(poster_path: $poster_path, adult: $adult, overview: $overview, release_date: $release_date, genre_ids: $genre_ids, id: $id, original_title: $original_title, original_language: $original_language, title: $title, backdrop_path: $backdrop_path, popularity: $popularity, vote_count: $vote_count, video: $video, vote_average: $vote_average)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Movie &&
        other.poster_path == poster_path &&
        other.adult == adult &&
        other.overview == overview &&
        other.release_date == release_date &&
        listEquals(other.genre_ids, genre_ids) &&
        other.id == id &&
        other.original_title == original_title &&
        other.original_language == original_language &&
        other.title == title &&
        other.backdrop_path == backdrop_path &&
        other.popularity == popularity &&
        other.vote_count == vote_count &&
        other.video == video &&
        other.vote_average == vote_average;
  }

  @override
  int get hashCode {
    return poster_path.hashCode ^
        adult.hashCode ^
        overview.hashCode ^
        release_date.hashCode ^
        genre_ids.hashCode ^
        id.hashCode ^
        original_title.hashCode ^
        original_language.hashCode ^
        title.hashCode ^
        backdrop_path.hashCode ^
        popularity.hashCode ^
        vote_count.hashCode ^
        video.hashCode ^
        vote_average.hashCode;
  }
}
