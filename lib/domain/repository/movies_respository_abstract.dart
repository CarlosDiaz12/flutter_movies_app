import 'package:dartz/dartz.dart';
import '../models/movie.dart';

abstract class MoviesRepositoryAbstract {
  Future<Either<Exception, List<Movie>>> getNowPlayingMovies();
}
