import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movies_app/core/constants/remote_constants.dart';
import 'package:flutter_movies_app/core/error/exceptions.dart';
import 'package:flutter_movies_app/data/remote/response/list_movies_response.dart';
import 'package:flutter_movies_app/domain/repository/movies_respository_abstract.dart';

class MoviesRepository extends MoviesRepositoryAbstract {
  final Dio _client;
  MoviesRepository({required Dio client}) : _client = client;
  @override
  Future<Either<Exception, ListMoviesResponse>> getNowPlayingMovies() async {
    try {
      var request = await _client.get(
        '/movie/now_playing',
        queryParameters: RemoteConstants.GetApiKeyQueryParam()
          ..addAll({'page': 1}),
      );
      var result = ListMoviesResponse.fromMap(request.data);
      result.results.sort(
          (a, b) => a.title!.toLowerCase().compareTo(b.title!.toLowerCase()));
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
