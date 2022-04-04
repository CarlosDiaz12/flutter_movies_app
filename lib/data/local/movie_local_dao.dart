import 'dart:convert';

import 'package:flutter_movies_app/core/constants/app_constants.dart';
import 'package:flutter_movies_app/data/local/dto/movie_local_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieLocalDao {
  late SharedPreferences _sharedPreferences;
  MovieLocalDao({required SharedPreferences sharedPreferences}) {
    _sharedPreferences = sharedPreferences;
  }

  Future<void> addMovieToFavorite(MovieLocalDto movie) async {
    if (_sharedPreferences.containsKey(AppConstants.FAVORITE_MOVIES_LIST_KEY)) {
      var savedMovies = getFavoriteMovies();
      await _sharedPreferences.remove(AppConstants.FAVORITE_MOVIES_LIST_KEY);
      savedMovies?.add(movie);
      var encodedList =
          jsonEncode(savedMovies?.map((movie) => movie.toMap()).toList());
      await _sharedPreferences.setString(
          AppConstants.FAVORITE_MOVIES_LIST_KEY, encodedList);
    } else {
      var movieList = <MovieLocalDto>[];
      movieList.add(movie);
      var encodedList =
          jsonEncode(movieList.map((movie) => movie.toMap()).toList());
      await _sharedPreferences.setString(
          AppConstants.FAVORITE_MOVIES_LIST_KEY, encodedList);
    }
  }

  Future<void> removeMovieFromFavorites(String movieId) async {
    var savedMovies =
        getFavoriteMovies()?.where((movie) => movie.Id != movieId).toList();
    await _sharedPreferences.remove(AppConstants.FAVORITE_MOVIES_LIST_KEY);
    var encodedList =
        jsonEncode(savedMovies?.map((movie) => movie.toMap()).toList());
    await _sharedPreferences.setString(
        AppConstants.FAVORITE_MOVIES_LIST_KEY, encodedList);
  }

  List<MovieLocalDto>? getFavoriteMovies() {
    var results = <MovieLocalDto>[];
    if (_sharedPreferences.containsKey(AppConstants.FAVORITE_MOVIES_LIST_KEY)) {
      var moviesJson =
          _sharedPreferences.getString(AppConstants.FAVORITE_MOVIES_LIST_KEY)!;
      var decodedJson = (jsonDecode(moviesJson) as List<dynamic>)
          .map((movie) => MovieLocalDto.fromMap(movie));
      results = decodedJson.toList();
    }
    return results;
  }

  bool isAlreadyFavorite(String movieId) {
    var values = getFavoriteMovies();
    return values?.any((element) => element.Id == movieId) ?? false;
  }
}
