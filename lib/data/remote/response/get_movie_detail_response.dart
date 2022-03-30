// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetMovieDetailResponse {
  bool? adult;
  String? backdrop_path;
  int? budget;
  List<GenreResponse>? genres;
  String? homepage;
  int? id;
  String? imdb_id;
  String? original_language;
  String? original_title;
  String? overview;
  double? popularity;
  String? poster_path;
  List<ProductionCompanyResponse>? production_companies;
  List<ProductionCountryResponse>? production_countries;
  String? release_date;
  int? revenue;
  int? runtime;
  List<SpokenLanguageResponse>? spoken_languages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? vote_average;
  int? vote_count;
  GetMovieDetailResponse({
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

  GetMovieDetailResponse copyWith({
    bool? adult,
    String? backdrop_path,
    int? budget,
    List<GenreResponse>? genres,
    String? homepage,
    int? id,
    String? imdb_id,
    String? original_language,
    String? original_title,
    String? overview,
    double? popularity,
    String? poster_path,
    List<ProductionCompanyResponse>? production_companies,
    List<ProductionCountryResponse>? production_countries,
    String? release_date,
    int? revenue,
    int? runtime,
    List<SpokenLanguageResponse>? spoken_languages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? vote_average,
    int? vote_count,
  }) {
    return GetMovieDetailResponse(
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
      result.addAll({'backdro_path': backdrop_path});
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

  factory GetMovieDetailResponse.fromMap(Map<String, dynamic> map) {
    return GetMovieDetailResponse(
      adult: map['adult'],
      backdrop_path: map['backdrop_path'],
      budget: map['budget']?.toInt(),
      genres: map['genres'] != null
          ? List<GenreResponse>.from(
              map['genres']?.map((x) => GenreResponse.fromMap(x)))
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
          ? List<ProductionCompanyResponse>.from(map['production_companies']
              ?.map((x) => ProductionCompanyResponse.fromMap(x)))
          : null,
      production_countries: map['production_countries'] != null
          ? List<ProductionCountryResponse>.from(map['production_countries']
              ?.map((x) => ProductionCountryResponse.fromMap(x)))
          : null,
      release_date: map['release_date'],
      revenue: map['revenue']?.toInt(),
      runtime: map['runtime']?.toInt(),
      spoken_languages: map['spoken_languages'] != null
          ? List<SpokenLanguageResponse>.from(map['spoken_languages']
              ?.map((x) => SpokenLanguageResponse.fromMap(x)))
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

  factory GetMovieDetailResponse.fromJson(String source) =>
      GetMovieDetailResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GetMovieDetailResponse(adult: $adult, backdro_path: $backdrop_path, budget: $budget, genres: $genres, homepage: $homepage, id: $id, imdb_id: $imdb_id, original_language: $original_language, original_title: $original_title, overview: $overview, popularity: $popularity, poster_path: $poster_path, production_companies: $production_companies, production_countries: $production_countries, release_date: $release_date, revenue: $revenue, runtime: $runtime, spoken_languages: $spoken_languages, status: $status, tagline: $tagline, title: $title, video: $video, vote_average: $vote_average, vote_count: $vote_count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetMovieDetailResponse &&
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

class SpokenLanguageResponse {
  String? english_name;
  String? iso_639_1;
  String? name;
  SpokenLanguageResponse({
    this.english_name,
    this.iso_639_1,
    this.name,
  });

  SpokenLanguageResponse copyWith({
    String? english_name,
    String? iso_639_1,
    String? name,
  }) {
    return SpokenLanguageResponse(
      english_name: english_name ?? this.english_name,
      iso_639_1: iso_639_1 ?? this.iso_639_1,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (english_name != null) {
      result.addAll({'english_name': english_name});
    }
    if (iso_639_1 != null) {
      result.addAll({'iso_639_1': iso_639_1});
    }
    if (name != null) {
      result.addAll({'name': name});
    }

    return result;
  }

  factory SpokenLanguageResponse.fromMap(Map<String, dynamic> map) {
    return SpokenLanguageResponse(
      english_name: map['english_name'],
      iso_639_1: map['iso_639_1'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpokenLanguageResponse.fromJson(String source) =>
      SpokenLanguageResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'SpokenLanguageResponse(english_name: $english_name, iso_639_1: $iso_639_1, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpokenLanguageResponse &&
        other.english_name == english_name &&
        other.iso_639_1 == iso_639_1 &&
        other.name == name;
  }

  @override
  int get hashCode =>
      english_name.hashCode ^ iso_639_1.hashCode ^ name.hashCode;
}

class GenreResponse {
  int? id;
  String? name;
  GenreResponse({
    this.id,
    this.name,
  });

  GenreResponse copyWith({
    int? id,
    String? name,
  }) {
    return GenreResponse(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }

    return result;
  }

  factory GenreResponse.fromMap(Map<String, dynamic> map) {
    return GenreResponse(
      id: map['id']?.toInt(),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GenreResponse.fromJson(String source) =>
      GenreResponse.fromMap(json.decode(source));

  @override
  String toString() => 'GenreResponse(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenreResponse && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

class ProductionCountryResponse {
  String? iso_3166_1;
  String? name;
  ProductionCountryResponse({
    this.iso_3166_1,
    this.name,
  });

  ProductionCountryResponse copyWith({
    String? iso_3166_1,
    String? name,
  }) {
    return ProductionCountryResponse(
      iso_3166_1: iso_3166_1 ?? this.iso_3166_1,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (iso_3166_1 != null) {
      result.addAll({'iso_3166_1': iso_3166_1});
    }
    if (name != null) {
      result.addAll({'name': name});
    }

    return result;
  }

  factory ProductionCountryResponse.fromMap(Map<String, dynamic> map) {
    return ProductionCountryResponse(
      iso_3166_1: map['iso_3166_1'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCountryResponse.fromJson(String source) =>
      ProductionCountryResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductionCountryResponse(iso_3166_1: $iso_3166_1, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductionCountryResponse &&
        other.iso_3166_1 == iso_3166_1 &&
        other.name == name;
  }

  @override
  int get hashCode => iso_3166_1.hashCode ^ name.hashCode;
}

class ProductionCompanyResponse {
  int? id;
  String? logo_path;
  String? name;
  String? origin_country;
  ProductionCompanyResponse({
    this.id,
    this.logo_path,
    this.name,
    this.origin_country,
  });

  ProductionCompanyResponse copyWith({
    int? id,
    String? logo_path,
    String? name,
    String? origin_country,
  }) {
    return ProductionCompanyResponse(
      id: id ?? this.id,
      logo_path: logo_path ?? this.logo_path,
      name: name ?? this.name,
      origin_country: origin_country ?? this.origin_country,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (logo_path != null) {
      result.addAll({'logo_path': logo_path});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (origin_country != null) {
      result.addAll({'origin_country': origin_country});
    }

    return result;
  }

  factory ProductionCompanyResponse.fromMap(Map<String, dynamic> map) {
    return ProductionCompanyResponse(
      id: map['id']?.toInt(),
      logo_path: map['logo_path'],
      name: map['name'],
      origin_country: map['origin_country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCompanyResponse.fromJson(String source) =>
      ProductionCompanyResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductionCompanyResponse(id: $id, logo_path: $logo_path, name: $name, origin_country: $origin_country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductionCompanyResponse &&
        other.id == id &&
        other.logo_path == logo_path &&
        other.name == name &&
        other.origin_country == origin_country;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        logo_path.hashCode ^
        name.hashCode ^
        origin_country.hashCode;
  }
}
