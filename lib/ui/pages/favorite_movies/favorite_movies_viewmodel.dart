import 'package:flutter_movies_app/data/local/dto/movie_local_dto.dart';
import 'package:flutter_movies_app/data/local/movie_local_dao.dart';
import 'package:stacked/stacked.dart';

class FavoriteMoviesViewModel extends BaseViewModel {
  final MovieLocalDao movieLocalDao;
  List<MovieLocalDto>? _favoriteMovies;
  List<MovieLocalDto>? get favoriteMovies => _favoriteMovies;
  FavoriteMoviesViewModel({
    required this.movieLocalDao,
  });

  Future<void> loadData() async {
    setBusy(true);
    var res = movieLocalDao.getFavoriteMovies();
    _favoriteMovies = res;
    setBusy(false);
  }
}
