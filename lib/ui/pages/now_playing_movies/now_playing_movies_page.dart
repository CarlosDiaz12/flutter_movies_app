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
            title: Text('Example Page'),
          ),
          body: viewModel.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  itemCount: viewModel.moviesList!.results.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                    childAspectRatio: 5 / 3,
                    crossAxisSpacing: 10,
                    // mainAxisSpacing: 5,
                  ),
                  padding: const EdgeInsets.all(4),
                  itemBuilder: (ctx, index) {
                    var movie = viewModel.moviesList!.results[index];
                    return Container(
                      child: Image.network(
                          '${RemoteConstants.IMAGE_API_URL}${movie.backdrop_path}'),
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
