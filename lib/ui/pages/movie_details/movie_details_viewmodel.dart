import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:flutter_movies_app/domain/models/movie_cast.dart';
import 'package:flutter_movies_app/domain/models/movie_detail.dart';
import 'package:stacked/stacked.dart';

class MovieDetailsViewModel extends BaseViewModel {
  MoviesRepository repository;
  MovieDetail? _movie;
  MovieDetail? get movie => _movie;
  MovieCast? _cast;
  MovieCast? get cast => _cast;
  bool _rateMovieSuccess = false;
  bool get rateMovieSuccess => _rateMovieSuccess;
  double _currentRate = 0.0;
  double get currentRate => _currentRate;
  int movieId;
  MovieDetailsViewModel({
    required this.movieId,
    required this.repository,
  });

  void updateRate(double newValue) {
    _currentRate = newValue;
    notifyListeners();
  }

  Future<void> loadData() async {
    await _loadBasicDetails();
    await _loadCast();
  }

  Future<void> _loadBasicDetails() async {
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

  Future<void> _loadCast() async {
    clearErrors();
    setBusyForObject(_cast, true);
    var res = await repository.getMovieCast(movieId);
    res.fold((ex) {
      setError(ex);
    }, (data) {
      _cast = data;
    });
    setBusyForObject(_cast, false);
  }

  Future<void> rateMovie() async {
    _rateMovieSuccess = false;
    clearErrors();
    setBusyForObject(_rateMovieSuccess, true);
    var res = await repository.rateMovie(movieId, currentRate);
    res.fold((ex) {
      setErrorForObject(_rateMovieSuccess, ex);
    }, (data) {
      _rateMovieSuccess = data;
    });
    setBusyForObject(_rateMovieSuccess, false);
  }
}
