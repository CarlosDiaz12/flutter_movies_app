import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movies_app/core/constants/remote_constants.dart';
import 'package:flutter_movies_app/core/error/exceptions.dart';
import 'package:flutter_movies_app/data/mapper/movie_cast_mapper.dart';
import 'package:flutter_movies_app/data/mapper/movie_details_mapper.dart';
import 'package:flutter_movies_app/data/mapper/movie_mapper.dart';
import 'package:flutter_movies_app/data/remote/response/get_movie_cast.dart';
import 'package:flutter_movies_app/data/remote/response/get_movie_detail_response.dart';
import 'package:flutter_movies_app/data/remote/response/list_movies_response.dart';
import 'package:flutter_movies_app/domain/models/movie.dart';
import 'package:flutter_movies_app/domain/models/movie_cast.dart';
import 'package:flutter_movies_app/domain/models/movie_detail.dart';
import 'package:flutter_movies_app/domain/repository/movies_respository_abstract.dart';

class MoviesRepository extends MoviesRepositoryAbstract {
  late final Dio _client;
  MoviesRepository({required Dio client}) {
    _client = client;
  }

  @override
  Future<Either<Exception, List<Movie>>> getNowPlayingMovies() async {
    try {
      var request = await _client.get(
        '/movie/now_playing',
        queryParameters: RemoteConstants.GetApiKeyQueryParam()
          ..addAll({'page': 1}),
      );
      var response = ListMoviesResponse.fromMap(request.data);
      response.results.sort(
          (a, b) => a.title!.toLowerCase().compareTo(b.title!.toLowerCase()));

      var result =
          response.results.map((m) => MovieMapper().toModel(m)).toList();
      return Right(result);
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundException('Recurso no encontrado.'));
      }
      return Left(ServerException(
          'Error: ${e.response?.statusCode} intentado conectar al servidor'));
    } catch (e) {
      return Left(UnknownErrorException('Error inesperado: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Exception, MovieDetail>> getMovieDetails(int movieId) async {
    try {
      var request = await _client.get(
        '/movie/$movieId',
        queryParameters: RemoteConstants.GetApiKeyQueryParam(),
      );
      var response = GetMovieDetailResponse.fromMap(request.data);
      var result = MovieDetailsMapper().toModel(response);
      return Right(result);
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundException('Recurso no encontrado.'));
      }
      return Left(ServerException(
          'Error: ${e.response?.statusCode} intentado conectar al servidor'));
    } catch (e) {
      return Left(UnknownErrorException('Error inesperado: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Exception, MovieCast>> getMovieCast(int movieId) async {
    try {
      var request = await _client.get(
        '/movie/$movieId/credits',
        queryParameters: RemoteConstants.GetApiKeyQueryParam(),
      );
      var response = GetMovieCastResponse.fromMap(request.data);
      var result = MovieCastMapper().toModel(response);
      return Right(result);
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundException('Recurso no encontrado.'));
      }
      return Left(ServerException(
          'Error: ${e.response?.statusCode} intentado conectar al servidor'));
    } catch (e) {
      return Left(UnknownErrorException('Error inesperado: ${e.toString()}'));
    }
  }
}
