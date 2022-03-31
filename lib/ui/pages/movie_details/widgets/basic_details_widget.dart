import 'package:flutter/material.dart';
import 'package:flutter_movies_app/domain/models/genre.dart';
import 'package:stacked/stacked.dart';

import '../movie_details_viewmodel.dart';

class BasicDetailsWidget extends StatelessWidget {
  final String? title;
  final String? releaseDate;
  final double? voteAverage;
  final List<Genre>? genres;
  const BasicDetailsWidget({
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
            children: [
              _VoteAverageWidget(),
              SizedBox(width: 20),
              Container(
                width: 320,
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: genres?.length,
                  itemBuilder: (ctx, index) {
                    var item = genres?[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Chip(
                        backgroundColor: Colors.green[600],
                        label: Text(
                          '${item?.name}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
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

class _VoteAverageWidget extends ViewModelWidget<MovieDetailsViewModel> {
  const _VoteAverageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white,
      child: viewModel.busy(viewModel.movieRate)
          ? Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.black,
                ),
              ),
            )
          : Text(
              '${viewModel.movieRate}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
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
