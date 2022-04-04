import 'package:flutter/material.dart';
import 'package:flutter_movies_app/core/constants/remote_constants.dart';
import 'package:flutter_movies_app/core/error/exceptions.dart';
import 'package:flutter_movies_app/ui/pages/favorite_movies/favorite_movies_viewmodel.dart';
import 'package:stacked/stacked.dart';

class FavoriteMoviesPage extends StatelessWidget {
  const FavoriteMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavoriteMoviesViewModel>.reactive(
      builder: (context, viewModel, _) => Scaffold(
        appBar: AppBar(title: Text('Favorite Movies')),
        body: viewModel.hasError ? _ErrorWidget() : _MainBody(),
      ),
      viewModelBuilder: () => FavoriteMoviesViewModel(),
    );
  }
}

class _MainBody extends ViewModelWidget<FavoriteMoviesViewModel> {
  const _MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    var imageHeight = MediaQuery.of(context).size.height * 0.80;
    var imageWidth = MediaQuery.of(context).size.width * 0.90;
    return viewModel.isBusy
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            constraints: BoxConstraints(maxHeight: imageHeight),
            child: ListView.separated(
              separatorBuilder: (ctx, int) => SizedBox(width: 8),
              itemCount: 2,
              cacheExtent: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  margin: EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      child: Image.network(
                        '${RemoteConstants.IMAGE_API_URL}/qsdjk9oAKSQMWs0Vt5Pyfh6O4GZ.jpg',
                        cacheWidth: imageWidth.toInt(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
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
