import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:stacked/stacked.dart';

class ExampleViewModel extends BaseViewModel {
  MoviesRepository repository;

  ExampleViewModel({
    required this.repository,
  });

  Future<bool> hello() async {
    print('hello');
    var res = await repository.getNowPlayingMovies();
    bool response = false;
    res.fold((ex) {
      print('Error');
    }, (data) {
      print('hay datos');
      response = true;
    });
    return response;
  }
}
