import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movies_app/core/constants/remote_constants.dart';
import 'package:flutter_movies_app/core/error/exceptions.dart';
import 'package:flutter_movies_app/data/local/local_dao.dart';
import 'package:flutter_movies_app/data/mapper/guest_session_info_mapper.dart';
import 'package:flutter_movies_app/data/mapper/movie_cast_mapper.dart';
import 'package:flutter_movies_app/data/mapper/movie_details_mapper.dart';
import 'package:flutter_movies_app/data/mapper/movie_mapper.dart';
import 'package:flutter_movies_app/data/remote/request/rate_movie_request.dart';
import 'package:flutter_movies_app/data/remote/response/get_movie_cast.dart';
import 'package:flutter_movies_app/data/remote/response/get_movie_detail_response.dart';
import 'package:flutter_movies_app/data/remote/response/list_movies_response.dart';
import 'package:flutter_movies_app/data/remote/response/rate_movie_response.dart';
import 'package:flutter_movies_app/domain/models/guest_session_info.dart';
import 'package:flutter_movies_app/domain/models/movie.dart';
import 'package:flutter_movies_app/domain/models/movie_cast.dart';
import 'package:flutter_movies_app/domain/models/movie_detail.dart';
import 'package:flutter_movies_app/domain/repository/movies_respository_abstract.dart';

import '../remote/response/get_guest_session_id.dart';

class MoviesRepository extends MoviesRepositoryAbstract {
  late final Dio _client;
  late final LocalDao _localDao;
  MoviesRepository({required Dio client, required LocalDao localDao}) {
    _client = client;
    _localDao = localDao;
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
      if (e.response?.statusCode == 401) {
        return Left(NotAuthorizedException('No tienes permisos suficientes'));
      }
      return Left(ServerException(
          'Error: ${e.response?.statusCode ?? ""} intentado conectar al servidor'));
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
      if (e.response?.statusCode == 401) {
        return Left(NotAuthorizedException('No tienes permisos suficientes'));
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
      if (e.response?.statusCode == 401) {
        return Left(NotAuthorizedException('No tienes permisos suficientes'));
      }
      return Left(ServerException(
          'Error: ${e.response?.statusCode} intentado conectar al servidor'));
    } catch (e) {
      return Left(UnknownErrorException('Error inesperado: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Exception, bool>> rateMovie(int movieId, double value) async {
    try {
      var realValue = value * 2;
      var requestData = RateMovieRequest(value: realValue);
      var sesionId = _localDao.getGuestSessionId();
      var request = await _client.post(
        '/movie/$movieId/rating',
        data: requestData.toMap(),
        queryParameters: RemoteConstants.GetApiKeyQueryParam()
          ..addAll({'guest_session_id': sesionId}),
      );
      var response = RateMovieRespose.fromMap(request.data);
      if (response.status_code != 1)
        return Left(NotFoundException("El recurso no fue encontrado"));

      return Right(true);
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundException('Recurso no encontrado.'));
      }
      if (e.response?.statusCode == 401) {
        return Left(NotAuthorizedException('No tienes permisos suficientes'));
      }
      return Left(ServerException(
          'Error: ${e.response?.statusCode} intentado conectar al servidor'));
    } catch (e) {
      return Left(UnknownErrorException('Error inesperado: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Exception, GuestSessionInfo>> getGuestSessionId() async {
    try {
      var request = await _client.post('/authentication/guest_session/new',
          queryParameters: RemoteConstants.GetApiKeyQueryParam());

      var response = GetGuestSessionIdResponse.fromMap(request.data);
      if (!response.success)
        throw Exception("No se pudo obtener el session id");
      return Right(GuestSessionInfoMapper().toModel(response));
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(NotFoundException('Recurso no encontrado.'));
      }
      if (e.response?.statusCode == 401) {
        return Left(NotAuthorizedException('No tienes permisos suficientes'));
      }
      return Left(ServerException(
          'Error: ${e.response?.statusCode} intentado conectar al servidor'));
    } catch (e) {
      return Left(UnknownErrorException('Error inesperado: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Exception, List<Movie>>> getSimilarMovies(int movieId) async {
    try {
      var request = await _client.get(
        '/movie/$movieId/similar',
        queryParameters: RemoteConstants.GetApiKeyQueryParam(),
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
      if (e.response?.statusCode == 401) {
        return Left(NotAuthorizedException('No tienes permisos suficientes'));
      }
      return Left(ServerException(
          'Error: ${e.response?.statusCode ?? ""} intentado conectar al servidor'));
    } catch (e) {
      return Left(UnknownErrorException('Error inesperado: ${e.toString()}'));
    }
  }
}
