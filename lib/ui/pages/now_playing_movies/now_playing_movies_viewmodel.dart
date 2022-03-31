import 'package:flutter_movies_app/data/local/local_dao.dart';
import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:flutter_movies_app/domain/models/movie.dart';
import 'package:stacked/stacked.dart';

class NowPlayingMoviesViewModel extends BaseViewModel {
  final String busyObjectKey = 'movies-list';
  final LocalDao localDao;
  MoviesRepository repository;
  List<Movie>? _moviesList;
  List<Movie>? get moviesList => _moviesList;
  NowPlayingMoviesViewModel({
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
      _moviesList = data;
    });
    setBusy(false);
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
