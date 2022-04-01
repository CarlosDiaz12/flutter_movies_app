import 'package:flutter/material.dart';
import 'package:flutter_movies_app/core/constants/remote_constants.dart';
import 'package:flutter_movies_app/domain/models/movie_cast.dart';

class CastItemWidget extends StatelessWidget {
  const CastItemWidget({
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
