import 'package:flutter/material.dart';
import 'package:popular_movies/model/list_item.dart';
import 'package:popular_movies/l10n/localizations.dart';
import 'package:popular_movies/ui/search/search_movie_item.dart';
import 'package:popular_movies/utils/error_utils.dart';

class SearchListItem extends StatelessWidget {
  const SearchListItem(this.listItem, this.onRetry);
  final ListItem listItem;
  final Function onRetry;

  @override
  Widget build(BuildContext context) {
    if (listItem is MovieItem) {
      final MovieItem item = listItem;
      return SearchMovieItem(item.movie);
    } else if (listItem is LoadingItem) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (listItem is LoadingFailed) {
      final LoadingFailed item = listItem;
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                getFriendlyNetworkErrorMessage(context, item.error),
                textAlign: TextAlign.center,
              ),
              FlatButton(
                onPressed: onRetry,
                child: Text(AppLocalizations.of(context).retry.toUpperCase()),
                textColor: Theme.of(context).accentColor,
              )
            ],
          ),
        ),
      );
    } else {
      throw Exception('listItem is unknown!');
    }
  }
}
