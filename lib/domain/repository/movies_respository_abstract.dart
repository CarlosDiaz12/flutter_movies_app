import 'package:dartz/dartz.dart';
import 'package:flutter_movies_app/domain/models/guest_session_info.dart';
import 'package:flutter_movies_app/domain/models/guest_session_list_info.dart';
import 'package:flutter_movies_app/domain/models/movie_cast.dart';
import 'package:flutter_movies_app/domain/models/movie_detail.dart';
import '../models/movie.dart';

abstract class MoviesRepositoryAbstract {
  Future<Either<Exception, List<Movie>>> getNowPlayingMovies();
  Future<Either<Exception, MovieDetail>> getMovieDetails(int movieId);
  Future<Either<Exception, MovieCast>> getMovieCast(int movieId);
  Future<Either<Exception, bool>> rateMovie(int movieId, double value);
  Future<Either<Exception, GuestSessionInfo>> getGuestSessionId();
  Future<Either<Exception, List<Movie>>> getSimilarMovies(int movieId);
  Future<Either<Exception, GuestSessionListInfo>> createGuestList(
      String sessionId);
}
