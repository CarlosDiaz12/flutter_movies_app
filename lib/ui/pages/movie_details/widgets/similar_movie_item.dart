import 'package:flutter/material.dart';
import 'package:flutter_movies_app/core/constants/remote_constants.dart';
import 'package:flutter_movies_app/domain/models/movie.dart';

class SimilarMovieItem extends StatelessWidget {
  const SimilarMovieItem({
    Key? key,
    required this.item,
    required this.imageWidth,
    required this.imageHeight,
  }) : super(key: key);

  final Movie? item;
  final double imageWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 8,
      child: item?.poster_path == null
          ? Container(
              width: imageWidth,
              height: imageHeight,
              child: Center(
                child: Text(
                  'No Image available',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : Image.network(
              '${RemoteConstants.IMAGE_API_URL}${item?.poster_path}',
              fit: BoxFit.cover,
              cacheWidth: 260,
              colorBlendMode: BlendMode.modulate,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                  width: imageWidth,
                  height: imageHeight,
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
    );
  }
}
