import 'package:flutter/material.dart';
import 'package:flutter_movies_app/core/constants/remote_constants.dart';
import 'package:flutter_movies_app/data/repository/movies_repository.dart';
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
          body: viewModel.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemCount: viewModel.moviesList!.results.length,
                  separatorBuilder: (ctx, int) => SizedBox(height: 6),
                  itemBuilder: (ctx, index) {
                    var movie = viewModel.moviesList!.results[index];
                    return Card(
                      elevation: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.network(
                                  '${RemoteConstants.IMAGE_API_URL}${movie.backdrop_path}',
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Container(
                                      width: 500,
                                      height: 250,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                left: 8,
                                top: 8,
                                child: Text(
                                  '${movie.title}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 8,
                                bottom: 8,
                                child: Column(
                                  children: [
                                    Text(
                                      '${movie.release_date?.replaceAll('-', '/')}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 8,
                                bottom: 8,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.rate_review,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '${movie.vote_average}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
        );
      },
      onModelReady: (viewModel) async {
        await viewModel.loadData();
      },
      viewModelBuilder: () => NowPlayingMoviesViewModel(
        repository: Provider.of<MoviesRepository>(context),
      ),
    );
  }
}
