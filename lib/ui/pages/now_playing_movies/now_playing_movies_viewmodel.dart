import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:flutter_movies_app/domain/models/movie.dart';
import 'package:stacked/stacked.dart';

class NowPlayingMoviesViewModel extends BaseViewModel {
  final String busyObjectKey = 'movies-list';
  MoviesRepository repository;
  List<Movie>? _moviesList;
  List<Movie>? get moviesList => _moviesList;
  NowPlayingMoviesViewModel({
    required this.repository,
  });

  Future<void> loadData() async {
    clearErrors();
    setBusy(true);
    var res = await repository.getNowPlayingMovies();
    res.fold((ex) {
      setError(ex);
    }, (data) {
      _moviesList = data;
    });
    setBusy(false);
  }
}
