import 'package:flutter/material.dart';
import 'package:flutter_movies_app/core/constants/remote_constants.dart';
import 'package:flutter_movies_app/core/error/exceptions.dart';
import 'package:flutter_movies_app/data/local/movie_local_dao.dart';
import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:flutter_movies_app/ui/pages/movie_details/movie_details_viewmodel.dart';
import 'package:flutter_movies_app/ui/pages/movie_details/widgets/rating_section_widget.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'widgets/basic_details_widget.dart';
import 'widgets/cast_item_widget.dart';
import 'widgets/similar_movie_item.dart';

class MovieDetailsPage extends StatelessWidget {
  final int movieId;
  const MovieDetailsPage({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieDetailsViewModel>.reactive(
      builder: (context, viewModel, _) {
        return Scaffold(
          body: viewModel.hasError
              ? _ErrorWidget()
              : NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        floating: false,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Text(
                            '${viewModel.movie?.title ?? 'Loading...'}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: _MainBody(),
                ),
        );
      },
      onModelReady: (viewModel) async {
        await viewModel.loadData();
      },
      viewModelBuilder: () => MovieDetailsViewModel(
        movieLocalDao: Provider.of<MovieLocalDao>(context),
        movieId: movieId,
        repository: Provider.of<MoviesRepository>(context),
      ),
    );
  }
}

class _MainBody extends ViewModelWidget<MovieDetailsViewModel> {
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
        : SingleChildScrollView(
            child: Column(
              children: [
                Material(
                  elevation: 16,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        _PosterWidget(posterPath: viewModel.movie?.poster_path),
                        BasicDetailsWidget(
                          title: viewModel.movie?.original_title,
                          releaseDate: viewModel.movie?.release_date,
                          voteAverage: viewModel.movie?.vote_average,
                          genres: viewModel.movie?.genres,
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                            icon: Icon(Icons.favorite),
                            color: (viewModel.movie?.isFavorite ?? false)
                                ? Colors.red
                                : Colors.white,
                            iconSize: 36,
                            onPressed: () async {
                              var res = await viewModel.addMovieToFavorites();
                              var action = res ? 'added to' : 'removed from';
                              _showSnackBar(context,
                                  '${viewModel.movie?.original_title} $action Favorites');
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12),
                _OverviewSection(),
              ],
            ),
          );
  }
}

class _OverviewSection extends ViewModelWidget<MovieDetailsViewModel> {
  const _OverviewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    var contentWidth = MediaQuery.of(context).size.width;
    return Container(
      width: contentWidth,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingSectionWidget(),
          SizedBox(height: 10),
          _SubtitleWidget(
            text: 'Synopsis',
          ),
          SizedBox(height: 10),
          Text(
            '${viewModel.movie?.overview}',
            softWrap: true,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10),
          _SubtitleWidget(text: 'Cast'),
          _CastListWidget(contentWidth: contentWidth),
          SizedBox(height: 10),
          _SubtitleWidget(text: 'Similar Movies'),
          _SimilarMoviesSection(contentWidth: contentWidth)
        ],
      ),
    );
  }
}

class _SimilarMoviesSection extends ViewModelWidget<MovieDetailsViewModel> {
  final double contentWidth;
  const _SimilarMoviesSection({Key? key, required this.contentWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    double imageHeight = 320;
    double imageWidth = 250;
    return viewModel.busy(viewModel.similarMovies)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            margin: EdgeInsets.only(top: 10),
            width: contentWidth,
            height: 500,
            child: GridView.builder(
              itemCount: viewModel.similarMovies?.length,
              cacheExtent: 6,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (context, index) {
                var item = viewModel.similarMovies?[index];
                return SimilarMovieItem(
                    item: item,
                    imageWidth: imageWidth,
                    imageHeight: imageHeight);
              },
            ));
  }
}

class _CastListWidget extends ViewModelWidget<MovieDetailsViewModel> {
  const _CastListWidget({
    Key? key,
    required this.contentWidth,
  }) : super(key: key);

  final double contentWidth;

  @override
  Widget build(BuildContext context, viewModel) {
    return viewModel.busy(viewModel.cast)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            height: 160,
            width: contentWidth,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: viewModel.cast!.cast?.length,
              itemBuilder: (ctx, index) {
                var item = viewModel.cast?.cast?[index];
                return CastItemWidget(item: item);
              },
            ),
          );
  }
}

class _SubtitleWidget extends StatelessWidget {
  final String? text;
  const _SubtitleWidget({
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _PosterWidget extends StatelessWidget {
  final String? posterPath;
  const _PosterWidget({
    this.posterPath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      '${RemoteConstants.IMAGE_API_URL}$posterPath',
      cacheWidth: 500,
      cacheHeight: 580,
      colorBlendMode: BlendMode.modulate,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Container(
          width: 500,
          height: 580,
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
    );
  }
}

class _ErrorWidget extends ViewModelWidget<MovieDetailsViewModel> {
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
