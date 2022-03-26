import 'package:flutter/material.dart';
import 'package:flutter_movies_app/core/constants/remote_constants.dart';
import 'package:flutter_movies_app/core/error/exceptions.dart';
import 'package:flutter_movies_app/data/repository/movies_repository.dart';
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
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          // ),
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
                        Image.network(
                          '${RemoteConstants.IMAGE_API_URL}${viewModel.movie?.poster_path}',
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
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          left: 10,
                          bottom: 30,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${viewModel.movie?.original_title?.toUpperCase()}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '${viewModel.movie?.release_date?.substring(0, 4)}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    child: Text(
                                      '${viewModel.movie?.vote_average}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  ...viewModel.movie!.genres!
                                      .map(
                                        (e) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0),
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
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sinopsis',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${viewModel.movie?.overview}',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  )
                ],
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
