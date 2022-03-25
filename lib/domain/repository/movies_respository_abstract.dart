import 'package:dartz/dartz.dart';
import 'package:flutter_movies_app/data/remote/response/list_movies_response.dart';

abstract class MoviesRepositoryAbstract {
  Future<Either<Exception, ListMoviesResponse>> getNowPlayingMovies();
}
