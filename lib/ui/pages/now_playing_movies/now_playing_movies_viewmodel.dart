import 'package:flutter_movies_app/data/local/dto/movie_local_dto.dart';
import 'package:flutter_movies_app/data/local/local_dao.dart';
import 'package:flutter_movies_app/data/local/movie_local_dao.dart';
import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:flutter_movies_app/domain/models/movie.dart';
import 'package:stacked/stacked.dart';

class NowPlayingMoviesViewModel extends BaseViewModel {
  final String busyObjectKey = 'movies-list';
  final LocalDao localDao;
  final MovieLocalDao movieLocalDao;
  MoviesRepository repository;
  List<Movie>? _moviesList;
  List<Movie>? get moviesList => _moviesList;
  NowPlayingMoviesViewModel({
    required this.movieLocalDao,
    required this.repository,
    required this.localDao,
  });

  Future<void> loadData() async {
    clearErrors();
    setBusy(true);
    var res = await repository.getNowPlayingMovies();
    res.fold((ex) {
      setError(ex);
    }, (data) {
      _moviesList = data.map((e) {
        e.isFavorite = movieLocalDao.isAlreadyFavorite(e.id.toString());
        return e;
      }).toList();
    });
    setBusy(false);
  }

  Future<bool> addMovieToFavorites(Movie movie, bool fromDetailPage) async {
    bool currentState = false;
    if (!fromDetailPage) {
      var movieDto = MovieLocalDto(
          Id: movie.id.toString(),
          title: movie.original_title,
          release_date: movie.release_date,
          vote_average: movie.vote_average,
          poster_path: movie.poster_path);
      var alreadyFavorite =
          movieLocalDao.isAlreadyFavorite(movie.id.toString());

      if (alreadyFavorite) {
        await movieLocalDao.removeMovieFromFavorites(movie.id.toString());
      } else {
        currentState = true;
        await movieLocalDao.addMovieToFavorite(movieDto);
      }
    }

    var selectedMovie =
        _moviesList?.where((element) => element.id == movie.id).first;

    selectedMovie?.isFavorite = currentState;
    notifyListeners();
    return currentState;
  }

  Future<void> checkAndGetSessionId() async {
    var currentSessionId = localDao.getGuestSessionId();
    bool hasToUpdateSession = false;
    if (currentSessionId == null) {
      hasToUpdateSession = true;
    } else {
      var sessionExpireDate = localDao.getSessionExpireDate();
      if (sessionExpireDate == null ||
          sessionExpireDate.compareTo(DateTime.now()) < 0) {
        hasToUpdateSession = true;
      }
    }

    if (hasToUpdateSession) {
      String newGuestId = '';
      String newSessionExpireDate = '';
      var response = await repository.getGuestSessionId();
      response.fold((ex) {
        setError(ex);
      }, (data) {
        newGuestId = data.guest_session_id;
        newSessionExpireDate = data.expires_at;
      });
      await localDao.saveGuestSessionInfo(newGuestId, newSessionExpireDate);
    }
  }
}
