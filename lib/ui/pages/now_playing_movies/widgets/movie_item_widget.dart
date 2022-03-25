import 'package:flutter/material.dart';
import 'package:flutter_movies_app/core/constants/remote_constants.dart';
import 'package:flutter_movies_app/domain/models/movie.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: Stack(
          fit: StackFit.loose,
          children: [
            _MovieBanner(bannerUrl: movie.backdrop_path),
            _MovieTitle(title: movie.title),
            _MovieReleaseDate(releaseDate: movie.release_date),
            _MovieAverageVote(voteAverage: movie.vote_average)
          ],
        ),
      ),
    );
  }
}

class _MovieAverageVote extends StatelessWidget {
  const _MovieAverageVote({
    Key? key,
    required this.voteAverage,
  }) : super(key: key);

  final double? voteAverage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
            '$voteAverage',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieReleaseDate extends StatelessWidget {
  const _MovieReleaseDate({
    Key? key,
    required this.releaseDate,
  }) : super(key: key);

  final String? releaseDate;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8,
      bottom: 8,
      child: Column(
        children: [
          Text(
            '${releaseDate?.replaceAll('-', '/')}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieTitle extends StatelessWidget {
  const _MovieTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.all(8),
        child: Text(
          '$title',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class _MovieBanner extends StatelessWidget {
  const _MovieBanner({
    Key? key,
    required this.bannerUrl,
  }) : super(key: key);

  final String? bannerUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      '${RemoteConstants.IMAGE_API_URL}$bannerUrl',
      cacheWidth: 500,
      cacheHeight: 300,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Container(
          width: 500,
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
    );
  }
}
