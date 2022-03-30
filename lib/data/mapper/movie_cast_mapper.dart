import 'package:flutter_movies_app/data/mapper/base_mapper.dart';
import 'package:flutter_movies_app/data/remote/response/get_movie_cast.dart'
    as response;
import 'package:flutter_movies_app/domain/models/movie_cast.dart';

class MovieCastMapper
    extends BaseMapper<MovieCast, response.GetMovieCastResponse> {
  @override
  response.GetMovieCastResponse toDto(MovieCast model) {
    throw UnimplementedError();
  }

  @override
  MovieCast toModel(response.GetMovieCastResponse dto) {
    return MovieCast(
      cast: dto.cast?.map((e) => Cast.fromMap(e.toMap())).toList(),
    );
  }
}
