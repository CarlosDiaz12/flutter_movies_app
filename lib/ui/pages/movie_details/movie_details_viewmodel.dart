import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:flutter_movies_app/domain/models/movie_detail.dart';
import 'package:stacked/stacked.dart';

class MovieDetailsViewModel extends BaseViewModel {
  MoviesRepository repository;
  MovieDetail? _movie;
  MovieDetail? get movie => _movie;
  int movieId;
  MovieDetailsViewModel({
    required this.movieId,
    required this.repository,
  });

  Future<void> loadData() async {
    clearErrors();
    setBusy(true);
    var res = await repository.getMovieDetails(movieId);
    res.fold((ex) {
      setError(ex);
    }, (data) {
      _movie = data;
    });
    setBusy(false);
  }
}
