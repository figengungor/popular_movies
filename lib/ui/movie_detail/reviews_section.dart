import 'package:flutter/material.dart';
import 'package:popular_movies/l10n/localizations.dart';
import 'package:popular_movies/model/review.dart';
import 'package:popular_movies/model/reviews.dart';
import 'package:popular_movies/ui/movie_detail/review_item.dart';
import 'package:popular_movies/ui/movie_detail/section_header.dart';


class ReviewsSection extends StatelessWidget {
  final Reviews reviews;
  static const int _maxLength = 3;
  const ReviewsSection(this.reviews);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionHeader(AppLocalizations.of(context).reviewsTitle),
        _buildReviewList(context),
      ],
    );
  }

  Widget _buildReviewList(BuildContext context) {
    if (reviews != null &&
        reviews.results != null &&
        reviews.results.isNotEmpty) {
      return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: reviews.results.length > _maxLength
              ? _maxLength
              : reviews.results.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildReviewItem(reviews.results[index]);
          });
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(AppLocalizations.of(context).noReviewsFound),
      );
    }
  }

  Widget _buildReviewItem(Review review) {
    return ReviewItem(review);
  }
}
