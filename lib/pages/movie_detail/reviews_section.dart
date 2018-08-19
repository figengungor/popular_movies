import 'package:flutter/material.dart';
import 'package:popular_movies/model/review.dart';
import 'package:popular_movies/model/reviews.dart';
import 'package:popular_movies/pages/movie_detail/review_item.dart';
import 'package:popular_movies/pages/movie_detail/section_header.dart';

class ReviewsSection extends StatelessWidget {
  final Reviews reviews;
  final int _maxLength = 3;

  ReviewsSection(this.reviews);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionHeader('Reviews'),
        _buildReviewList(),
      ],
    );
  }

  _buildReviewList() {
    if (reviews != null &&
        reviews.results != null &&
        reviews.results.length > 0) {
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
        child: Text('No reviews found'),
      );
    }
  }

  Widget _buildReviewItem(Review review) {
    return ReviewItem(review);
  }
}
