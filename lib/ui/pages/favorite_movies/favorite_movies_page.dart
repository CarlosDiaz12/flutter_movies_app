// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_movies_app/core/constants/remote_constants.dart';
import 'package:flutter_movies_app/core/error/exceptions.dart';
import 'package:flutter_movies_app/data/local/dto/movie_local_dto.dart';
import 'package:flutter_movies_app/data/local/movie_local_dao.dart';
import 'package:flutter_movies_app/ui/pages/favorite_movies/favorite_movies_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class FavoriteMoviesPage extends StatelessWidget {
  const FavoriteMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavoriteMoviesViewModel>.reactive(
      builder: (context, viewModel, _) => Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Favorite Movies')),
        body: viewModel.hasError ? _ErrorWidget() : _MainBody(),
      ),
      onModelReady: (viewModel) async {
        await viewModel.loadData();
      },
      viewModelBuilder: () => FavoriteMoviesViewModel(
          movieLocalDao: Provider.of<MovieLocalDao>(context)),
    );
  }
}

class _MainBody extends ViewModelWidget<FavoriteMoviesViewModel> {
  const _MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    var imageHeight = MediaQuery.of(context).size.height * 0.75;
    var imageWidth = MediaQuery.of(context).size.width * 0.90;
    return viewModel.isBusy
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            constraints: BoxConstraints(maxHeight: imageHeight),
            child: viewModel.favoriteMovies!.length == 0
                ? Center(
                    child: Text(
                    'No favorite movies added',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ))
                : ListView.builder(
                    itemCount: viewModel.favoriteMovies?.length ?? 0,
                    cacheExtent: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = viewModel.favoriteMovies![index];
                      return _FavoriteMovieItem(
                          movie: item, imageWidth: imageWidth);
                    },
                  ),
          );
  }
}

class _FavoriteMovieItem extends StatelessWidget {
  final MovieLocalDto movie;
  const _FavoriteMovieItem({
    required this.movie,
    Key? key,
    required this.imageWidth,
  }) : super(key: key);

  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 4,
          margin: EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              child: Image.network(
                '${RemoteConstants.IMAGE_API_URL}${movie.poster_path}',
                cacheWidth: imageWidth.toInt(),
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.3),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 30,
          right: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _VoteAverageWidget(
                vote_average: movie.vote_average,
              ),
              Container(
                width: 250,
                child: Text(
                  '${movie.title?.toUpperCase()}',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _VoteAverageWidget extends StatelessWidget {
  final double? vote_average;
  const _VoteAverageWidget({
    this.vote_average,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.white,
      child: Text(
        '$vote_average',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _ErrorWidget extends ViewModelWidget<FavoriteMoviesViewModel> {
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
          onPressed: null,
        ),
      ],
      content: Text(
        exception.cause,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
