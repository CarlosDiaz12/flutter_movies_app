import 'package:flutter/material.dart';
import 'package:flutter_movies_app/core/error/exceptions.dart';
import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:flutter_movies_app/ui/pages/movie_details/movie_details_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieDetailsViewModel>.reactive(
      builder: (context, viewModel, _) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Movie Details'),
            ),
            body: viewModel.hasError ? _ErrorWidget() : _MainBody());
      },
      onModelReady: (viewModel) async {},
      viewModelBuilder: () => MovieDetailsViewModel(
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
        : Container();
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
