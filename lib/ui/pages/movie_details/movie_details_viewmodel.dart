import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:flutter_movies_app/domain/models/movie.dart';
import 'package:stacked/stacked.dart';

class MovieDetailsViewModel extends BaseViewModel {
  MoviesRepository repository;
  Movie? _movie;
  Movie? get movie => _movie;
  MovieDetailsViewModel({
    required this.repository,
  });

  Future<void> loadData() async {
    clearErrors();
    setBusy(true);
    //var res = await repository.getNowPlayingMovies();
    // res.fold((ex) {
    //   setError(ex);
    // }, (data) {
    //   _movie = data;
    // });
    setBusy(false);
  }
}
