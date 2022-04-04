import 'package:flutter/material.dart';
import 'package:flutter_movies_app/ui/pages/favorite_movies/favorite_movies_viewmodel.dart';
import 'package:stacked/stacked.dart';

class FavoriteMoviesPage extends StatelessWidget {
  const FavoriteMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavoriteMoviesViewModel>.reactive(
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(title: Text('Favorite Movies')),
        body: Center(
          child: Text('Favorites page'),
        ),
      ),
      viewModelBuilder: () => FavoriteMoviesViewModel(),
    );
  }
}
