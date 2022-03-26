import 'package:flutter_movies_app/data/mapper/base_mapper.dart';
import 'package:flutter_movies_app/data/remote/response/get_movie_detail_response.dart';
import 'package:flutter_movies_app/domain/models/genre.dart';
import 'package:flutter_movies_app/domain/models/movie_detail.dart';
import 'package:flutter_movies_app/domain/models/production_company.dart';
import 'package:flutter_movies_app/domain/models/production_country.dart';
import 'package:flutter_movies_app/domain/models/spoken_language.dart';

class MovieDetailsMapper
    implements BaseMapper<MovieDetail, GetMovieDetailResponse> {
  @override
  GetMovieDetailResponse toDto(MovieDetail model) {
    throw UnimplementedError();
  }

  @override
  MovieDetail toModel(GetMovieDetailResponse dto) {
    return MovieDetail(
      adult: dto.adult,
      backdrop_path: dto.backdrop_path,
      budget: dto.budget,
      genres: dto.genres?.map((e) => Genre(id: e.id, name: e.name)).toList(),
      homepage: dto.homepage,
      id: dto.id,
      imdb_id: dto.imdb_id,
      original_language: dto.original_language,
      original_title: dto.original_title,
      overview: dto.overview,
      popularity: dto.popularity,
      poster_path: dto.poster_path,
      production_companies: dto.production_companies
          ?.map((e) => ProductionCompany(
              id: e.id,
              logo_path: e.logo_path,
              name: e.name,
              origin_country: e.origin_country))
          .toList(),
      production_countries: dto.production_countries
          ?.map(
              (e) => ProductionCountry(iso_3166_1: e.iso_3166_1, name: e.name))
          .toList(),
      release_date: dto.release_date,
      revenue: dto.revenue,
      runtime: dto.runtime,
      spoken_languages: dto.spoken_languages
          ?.map((e) => SpokenLanguage(
              english_name: e.english_name,
              iso_639_1: e.iso_639_1,
              name: e.name))
          .toList(),
      status: dto.status,
      tagline: dto.tagline,
      title: dto.title,
      video: dto.video,
      vote_average: dto.vote_average,
      vote_count: dto.vote_count,
    );
  }
}
