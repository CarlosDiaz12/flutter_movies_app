import 'package:flutter_movies_app/data/remote/response/list_movies_response.dart';
import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:stacked/stacked.dart';

class NowPlayingMoviesViewModel extends BaseViewModel {
  MoviesRepository repository;
  ListMoviesResponse? _moviesList;
  ListMoviesResponse? get moviesList => _moviesList;
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
