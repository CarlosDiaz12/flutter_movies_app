import 'package:flutter_movies_app/data/mapper/base_mapper.dart';
import 'package:flutter_movies_app/data/remote/response/list_movies_response.dart';
import 'package:flutter_movies_app/domain/models/movie.dart';

class MovieMapper implements BaseMapper<Movie, MovieResponse> {
  @override
  MovieResponse toDto(Movie model) {
    throw UnimplementedError();
  }

  @override
  Movie toModel(MovieResponse dto) {
    return Movie(
        poster_path: dto.poster_path,
        adult: dto.adult,
        overview: dto.overview,
        release_date: dto.release_date,
        genre_ids: dto.genre_ids,
        id: dto.id,
        original_title: dto.original_title,
        original_language: dto.original_language,
        title: dto.title,
        backdrop_path: dto.backdrop_path,
        popularity: dto.popularity,
        vote_count: dto.vote_count,
        video: dto.video,
        vote_average: dto.vote_average);
  }
}
