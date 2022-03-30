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
    var res = localDao.getGuestSessionId();
    if (res == null) {
      String newGuestId = '';
      var res = await repository.getGuestSessionId();
      res.fold((ex) {
        setError(ex);
      }, (data) {
        newGuestId = data!;
      });

      if (newGuestId.isNotEmpty) {
        await localDao.saveGuestSessionId(newGuestId);
      }
    }
  }
}
