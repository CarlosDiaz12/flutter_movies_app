import 'package:flutter/material.dart';
import 'package:flutter_movies_app/core/error/exceptions.dart';
import 'package:flutter_movies_app/data/local/local_dao.dart';
import 'package:flutter_movies_app/data/local/movie_local_dao.dart';
import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:flutter_movies_app/ui/pages/now_playing_movies/widgets/movie_item_widget.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'now_playing_movies_viewmodel.dart';

class NowPlayingMoviesPage extends StatelessWidget {
  const NowPlayingMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NowPlayingMoviesViewModel>.reactive(
      builder: (context, viewModel, _) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Now Playing Movies'),
            ),
            body: viewModel.hasError ? _ErrorWidget() : _MainBody());
      },
      onModelReady: (viewModel) async {
        await viewModel.loadData();
        await viewModel.checkAndGetSessionId();
      },
      viewModelBuilder: () => NowPlayingMoviesViewModel(
        movieLocalDao: Provider.of<MovieLocalDao>(context),
        localDao: Provider.of<LocalDao>(context),
        repository: Provider.of<MoviesRepository>(context),
      ),
    );
  }
}

class _ErrorWidget extends ViewModelWidget<NowPlayingMoviesViewModel> {
  const _ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    var exception = (viewModel.modelError) as BaseException;
    return MaterialBanner(
      backgroundColor: Colors.red,
      actions: <Widget>[
        TextButton(
          child: Text(
            'Reintentar',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          onPressed: viewModel.loadData,
        ),
      ],
      content: Text(
        exception.cause,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

class _MainBody extends ViewModelWidget<NowPlayingMoviesViewModel> {
  const _MainBody({Key? key}) : super(key: key);

  _showSnackBar(BuildContext ctx, String message, [bool isError = false]) {
    var snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: isError ? Colors.red : Colors.green,
    );
    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context, viewModel) {
    return viewModel.isBusy
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.separated(
            cacheExtent: 50,
            itemCount: viewModel.moviesList!.length,
            separatorBuilder: (ctx, int) => SizedBox(height: 6),
            itemBuilder: (ctx, index) {
              var movie = viewModel.moviesList![index];
              return MovieItem(
                movie: movie,
                onFavoritePressed: (String movieTitle) async {
                  var res = await viewModel.addMovieToFavorites(movie);
                  var action = res ? 'added to' : 'removed from';
                  _showSnackBar(
                      context, '${movie.original_title} $action Favorites');
                },
              );
            },
          );
  }
}
