import 'package:flutter/material.dart';
import 'package:popular_movies/l10n/localizations.dart';
import 'package:popular_movies/model/review.dart';

class ReviewItem extends StatefulWidget {
  final Review review;

  ReviewItem(this.review);

  @override
  _ReviewItemState createState() => _ReviewItemState();
}

class _ReviewItemState extends State<ReviewItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: _onReviewTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _isExpanded
                ? Text(
                    widget.review.content,
                  )
                : Text(
                    widget.review.content,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              AppLocalizations.of(context).byName(widget.review.author),
              textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  void _onReviewTap() {
    setState(() => _isExpanded = !_isExpanded);
  }
}
