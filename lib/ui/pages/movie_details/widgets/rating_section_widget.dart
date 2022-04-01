import 'package:flutter/material.dart';
import 'package:flutter_movies_app/ui/pages/movie_details/movie_details_viewmodel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';

class RatingSectionWidget extends ViewModelWidget<MovieDetailsViewModel> {
  const RatingSectionWidget({
    Key? key,
  }) : super(key: key);

  _showSnackBar(BuildContext ctx) {
    const snackBar = SnackBar(
      content: Text(
        'Movie rated succesfuly!',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context, viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBar.builder(
          initialRating: viewModel.currentRate,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.only(right: 4),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            viewModel.updateRate(rating);
          },
        ),
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          onPressed: () async {
            if (viewModel.currentRate != 0) {
              await viewModel.rateMovie();
              await viewModel.reloadRatingInfo();
              _showSnackBar(context);
            }
          },
          child: viewModel.busy(viewModel.rateMovieSuccess)
              ? Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  ),
                )
              : Text(
                  'Rate',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
        ),
      ],
    );
  }
}
