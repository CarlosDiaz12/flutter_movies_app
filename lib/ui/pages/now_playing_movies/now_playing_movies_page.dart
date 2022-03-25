import 'package:flutter/material.dart';
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
          body: Column(
            children: [
              Text('Example Page'),
              ElevatedButton(
                onPressed: () {
                  viewModel.loadData();
                },
                child: Text('Call API'),
              ),
            ],
          ),
        );
      },
      viewModelBuilder: () => NowPlayingMoviesViewModel(
        repository: Provider.of<MoviesRepository>(context),
      ),
    );
  }
}
