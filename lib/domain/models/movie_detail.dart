// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'genre.dart';
import 'production_company.dart';
import 'production_country.dart';
import 'spoken_language.dart';

class MovieDetail {
  bool? adult;
  String? backdrop_path;
  int? budget;
  List<Genre>? genres;
  String? homepage;
  int? id;
  String? imdb_id;
  String? original_language;
  String? original_title;
  String? overview;
  double? popularity;
  String? poster_path;
  List<ProductionCompany>? production_companies;
  List<ProductionCountry>? production_countries;
  String? release_date;
  int? revenue;
  int? runtime;
  List<SpokenLanguage>? spoken_languages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? vote_average;
  int? vote_count;
  MovieDetail({
    this.adult,
    this.backdrop_path,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdb_id,
    this.original_language,
    this.original_title,
    this.overview,
    this.popularity,
    this.poster_path,
    this.production_companies,
    this.production_countries,
    this.release_date,
    this.revenue,
    this.runtime,
    this.spoken_languages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.vote_average,
    this.vote_count,
  });

  MovieDetail copyWith({
    bool? adult,
    String? backdrop_path,
    int? budget,
    List<Genre>? genres,
    String? homepage,
    int? id,
    String? imdb_id,
    String? original_language,
    String? original_title,
    String? overview,
    double? popularity,
    String? poster_path,
    List<ProductionCompany>? production_companies,
    List<ProductionCountry>? production_countries,
    String? release_date,
    int? revenue,
    int? runtime,
    List<SpokenLanguage>? spoken_languages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? vote_average,
    int? vote_count,
  }) {
    return MovieDetail(
      adult: adult ?? this.adult,
      backdrop_path: backdrop_path ?? this.backdrop_path,
      budget: budget ?? this.budget,
      genres: genres ?? this.genres,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      imdb_id: imdb_id ?? this.imdb_id,
      original_language: original_language ?? this.original_language,
      original_title: original_title ?? this.original_title,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      poster_path: poster_path ?? this.poster_path,
      production_companies: production_companies ?? this.production_companies,
      production_countries: production_countries ?? this.production_countries,
      release_date: release_date ?? this.release_date,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      spoken_languages: spoken_languages ?? this.spoken_languages,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      title: title ?? this.title,
      video: video ?? this.video,
      vote_average: vote_average ?? this.vote_average,
      vote_count: vote_count ?? this.vote_count,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (adult != null) {
      result.addAll({'adult': adult});
    }
    if (backdrop_path != null) {
      result.addAll({'backdrop_path': backdrop_path});
    }
    if (budget != null) {
      result.addAll({'budget': budget});
    }
    if (genres != null) {
      result.addAll({'genres': genres!.map((x) => x.toMap()).toList()});
    }
    if (homepage != null) {
      result.addAll({'homepage': homepage});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (imdb_id != null) {
      result.addAll({'imdb_id': imdb_id});
    }
    if (original_language != null) {
      result.addAll({'original_language': original_language});
    }
    if (original_title != null) {
      result.addAll({'original_title': original_title});
    }
    if (overview != null) {
      result.addAll({'overview': overview});
    }
    if (popularity != null) {
      result.addAll({'popularity': popularity});
    }
    if (poster_path != null) {
      result.addAll({'poster_path': poster_path});
    }
    if (production_companies != null) {
      result.addAll({
        'production_companies':
            production_companies!.map((x) => x.toMap()).toList()
      });
    }
    if (production_countries != null) {
      result.addAll({
        'production_countries':
            production_countries!.map((x) => x.toMap()).toList()
      });
    }
    if (release_date != null) {
      result.addAll({'release_date': release_date});
    }
    if (revenue != null) {
      result.addAll({'revenue': revenue});
    }
    if (runtime != null) {
      result.addAll({'runtime': runtime});
    }
    if (spoken_languages != null) {
      result.addAll({
        'spoken_languages': spoken_languages!.map((x) => x.toMap()).toList()
      });
    }
    if (status != null) {
      result.addAll({'status': status});
    }
    if (tagline != null) {
      result.addAll({'tagline': tagline});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (video != null) {
      result.addAll({'video': video});
    }
    if (vote_average != null) {
      result.addAll({'vote_average': vote_average});
    }
    if (vote_count != null) {
      result.addAll({'vote_count': vote_count});
    }

    return result;
  }

  factory MovieDetail.fromMap(Map<String, dynamic> map) {
    return MovieDetail(
      adult: map['adult'],
      backdrop_path: map['backdrop_path'],
      budget: map['budget']?.toInt(),
      genres: map['genres'] != null
          ? List<Genre>.from(map['genres']?.map((x) => Genre.fromMap(x)))
          : null,
      homepage: map['homepage'],
      id: map['id']?.toInt(),
      imdb_id: map['imdb_id'],
      original_language: map['original_language'],
      original_title: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity']?.toDouble(),
      poster_path: map['poster_path'],
      production_companies: map['production_companies'] != null
          ? List<ProductionCompany>.from(map['production_companies']
              ?.map((x) => ProductionCompany.fromMap(x)))
          : null,
      production_countries: map['production_countries'] != null
          ? List<ProductionCountry>.from(map['production_countries']
              ?.map((x) => ProductionCountry.fromMap(x)))
          : null,
      release_date: map['release_date'],
      revenue: map['revenue']?.toInt(),
      runtime: map['runtime']?.toInt(),
      spoken_languages: map['spoken_languages'] != null
          ? List<SpokenLanguage>.from(
              map['spoken_languages']?.map((x) => SpokenLanguage.fromMap(x)))
          : null,
      status: map['status'],
      tagline: map['tagline'],
      title: map['title'],
      video: map['video'],
      vote_average: map['vote_average']?.toDouble(),
      vote_count: map['vote_count']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetail.fromJson(String source) =>
      MovieDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieDetail(adult: $adult, backdrop_path: $backdrop_path, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdb_id: $imdb_id, original_language: $original_language, original_title: $original_title, overview: $overview, popularity: $popularity, poster_path: $poster_path, production_companies: $production_companies, production_countries: $production_countries, release_date: $release_date, revenue: $revenue, runtime: $runtime, spoken_languages: $spoken_languages, status: $status, tagline: $tagline, title: $title, video: $video, vote_average: $vote_average, vote_count: $vote_count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieDetail &&
        other.adult == adult &&
        other.backdrop_path == backdrop_path &&
        other.budget == budget &&
        listEquals(other.genres, genres) &&
        other.homepage == homepage &&
        other.id == id &&
        other.imdb_id == imdb_id &&
        other.original_language == original_language &&
        other.original_title == original_title &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.poster_path == poster_path &&
        listEquals(other.production_companies, production_companies) &&
        listEquals(other.production_countries, production_countries) &&
        other.release_date == release_date &&
        other.revenue == revenue &&
        other.runtime == runtime &&
        listEquals(other.spoken_languages, spoken_languages) &&
        other.status == status &&
        other.tagline == tagline &&
        other.title == title &&
        other.video == video &&
        other.vote_average == vote_average &&
        other.vote_count == vote_count;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        backdrop_path.hashCode ^
        budget.hashCode ^
        genres.hashCode ^
        homepage.hashCode ^
        id.hashCode ^
        imdb_id.hashCode ^
        original_language.hashCode ^
        original_title.hashCode ^
        overview.hashCode ^
        popularity.hashCode ^
        poster_path.hashCode ^
        production_companies.hashCode ^
        production_countries.hashCode ^
        release_date.hashCode ^
        revenue.hashCode ^
        runtime.hashCode ^
        spoken_languages.hashCode ^
        status.hashCode ^
        tagline.hashCode ^
        title.hashCode ^
        video.hashCode ^
        vote_average.hashCode ^
        vote_count.hashCode;
  }
}
