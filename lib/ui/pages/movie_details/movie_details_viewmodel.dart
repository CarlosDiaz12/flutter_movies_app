import 'package:flutter_movies_app/data/local/dto/movie_local_dto.dart';
import 'package:flutter_movies_app/data/local/movie_local_dao.dart';
import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:flutter_movies_app/domain/models/movie.dart';
import 'package:flutter_movies_app/domain/models/movie_cast.dart';
import 'package:flutter_movies_app/domain/models/movie_detail.dart';
import 'package:stacked/stacked.dart';

class MovieDetailsViewModel extends BaseViewModel {
  MoviesRepository repository;
  List<Movie>? _similarMovies;
  List<Movie>? get similarMovies => _similarMovies;
  MovieDetail? _movie;
  MovieDetail? get movie => _movie;
  MovieCast? _cast;
  MovieCast? get cast => _cast;
  bool _rateMovieSuccess = false;
  bool get rateMovieSuccess => _rateMovieSuccess;
  double _currentRate = 0.0;
  double get currentRate => _currentRate;
  double _movieRate = 0;
  double get movieRate => _movieRate;
  int movieId;
  MovieLocalDao movieLocalDao;
  MovieDetailsViewModel({
    required this.movieLocalDao,
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
    await loadSimilarMovies();
  }

  Future<void> _loadBasicDetails() async {
    clearErrors();
    setBusy(true);
    var res = await repository.getMovieDetails(movieId);
    res.fold((ex) {
      setError(ex);
    }, (data) {
      _movie = data;
      _movie?.isFavorite =
          movieLocalDao.isAlreadyFavorite(_movie!.id.toString());
      _movieRate = data.vote_average!;
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

  Future<void> reloadRatingInfo() async {
    clearErrors();
    setBusyForObject(_movieRate, true);
    var res = await repository.getMovieDetails(movieId);
    res.fold((ex) {
      setError(ex);
    }, (data) {
      _movieRate = data.vote_average!;
    });
    setBusyForObject(_movieRate, false);
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
    _currentRate = 0.0;
    setBusyForObject(_rateMovieSuccess, false);
  }

  Future<void> loadSimilarMovies() async {
    clearErrors();
    setBusyForObject(_similarMovies, true);
    var res = await repository.getSimilarMovies(movieId);
    res.fold((ex) {
      setError(ex);
    }, (data) {
      _similarMovies = data;
    });
    setBusyForObject(_similarMovies, false);
  }

  Future<bool> addMovieToFavorites() async {
    var movieDto = MovieLocalDto(
      Id: _movie?.id.toString(),
      title: _movie?.original_title,
      release_date: _movie?.release_date,
      vote_average: _movie?.vote_average,
      poster_path: _movie?.poster_path,
    );
    var alreadyFavorite =
        movieLocalDao.isAlreadyFavorite(_movie!.id.toString());
    bool currentState = false;
    if (alreadyFavorite) {
      await movieLocalDao.removeMovieFromFavorites(_movie!.id.toString());
    } else {
      currentState = true;
      await movieLocalDao.addMovieToFavorite(movieDto);
    }
    var selectedMovie = _movie;
    selectedMovie?.isFavorite = currentState;
    notifyListeners();
    return currentState;
  }
}
