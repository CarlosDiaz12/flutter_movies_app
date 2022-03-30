import 'package:flutter/material.dart';
import 'package:flutter_movies_app/core/constants/remote_constants.dart';
import 'package:flutter_movies_app/core/error/exceptions.dart';
import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:flutter_movies_app/domain/models/genre.dart';
import 'package:flutter_movies_app/domain/models/movie_cast.dart';
import 'package:flutter_movies_app/ui/pages/movie_details/movie_details_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class MovieDetailsPage extends StatelessWidget {
  final int movieId;
  const MovieDetailsPage({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieDetailsViewModel>.reactive(
      builder: (context, viewModel, _) {
        return Scaffold(
          body: viewModel.hasError ? _ErrorWidget() : _MainBody(),
        );
      },
      onModelReady: (viewModel) async {
        await viewModel.loadData();
      },
      viewModelBuilder: () => MovieDetailsViewModel(
        movieId: movieId,
        repository: Provider.of<MoviesRepository>(context),
      ),
    );
  }
}

class _MainBody extends ViewModelWidget<MovieDetailsViewModel> {
  const _MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return viewModel.isBusy
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Material(
                    elevation: 16,
                    child: Stack(
                      children: [
                        _PosterWidget(posterPath: viewModel.movie?.poster_path),
                        _BasicDetailsWidget(
                          title: viewModel.movie?.original_title,
                          releaseDate: viewModel.movie?.release_date,
                          voteAverage: viewModel.movie?.vote_average,
                          genres: viewModel.movie?.genres,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  _OverviewSection(),
                ],
              ),
            ),
          );
  }
}

class _BasicDetailsWidget extends StatelessWidget {
  final String? title;
  final String? releaseDate;
  final double? voteAverage;
  final List<Genre>? genres;
  const _BasicDetailsWidget({
    this.title,
    this.releaseDate,
    this.voteAverage,
    this.genres,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      bottom: 30,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TitleWidget(title: title),
          SizedBox(height: 2),
          _ReleaseDateWidget(releaseDate: releaseDate),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _VoteAverageWidget(voteAverage: voteAverage),
              SizedBox(width: 20),
              ...genres!
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Chip(
                        backgroundColor: Colors.green[600],
                        label: Text(
                          '${e.name}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList()
            ],
          )
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
    var contentWidth = MediaQuery.of(context).size.width * 0.90;
    return Container(
      width: contentWidth,
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SubtitleWidget(
            text: 'Sinopsis',
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
        ],
      ),
    );
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
                return _CastItemWidget(item: item);
              },
            ),
          );
  }
}

class _CastItemWidget extends StatelessWidget {
  const _CastItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Cast? item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Stack(
        children: [
          Container(
            child: item?.profile_path == null
                ? Container(
                    width: 100,
                    height: 300,
                    child: Center(
                      child: Text(
                        'No Image available',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : Image.network(
                    '${RemoteConstants.IMAGE_API_URL}${item?.profile_path}',
                    cacheWidth: 250,
                    cacheHeight: 300,
                    colorBlendMode: BlendMode.modulate,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Container(
                        width: 250,
                        height: 300,
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
                  ),
          ),
          Positioned.fill(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.black54,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${item?.name}',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '\"${item?.character}\"',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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

class _ReleaseDateWidget extends StatelessWidget {
  final String? releaseDate;
  const _ReleaseDateWidget({
    this.releaseDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${releaseDate?.substring(0, 4)}',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  final String? title;
  const _TitleWidget({
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${title?.toUpperCase()}',
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _VoteAverageWidget extends StatelessWidget {
  final double? voteAverage;
  const _VoteAverageWidget({
    this.voteAverage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white,
      child: Text(
        '$voteAverage',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
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
