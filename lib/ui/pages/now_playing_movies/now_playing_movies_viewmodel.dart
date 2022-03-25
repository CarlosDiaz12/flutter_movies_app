import 'package:flutter_movies_app/data/remote/response/list_movies_response.dart';
import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:stacked/stacked.dart';

class NowPlayingMoviesViewModel extends BaseViewModel {
  MoviesRepository repository;
  NowPlayingMoviesViewModel({
    required this.repository,
  });

  Future<ListMoviesResponse> loadData() async {
    clearErrors();
    var res = await repository.getNowPlayingMovies();
    var response;
    res.fold((ex) {
      setError(ex);
      response = null;
    }, (data) {
      response = data;
    });
    return response;
  }
}
