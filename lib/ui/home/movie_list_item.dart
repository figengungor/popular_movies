import 'package:flutter/material.dart';
import 'package:popular_movies/model/list_item.dart';
import 'package:popular_movies/l10n/localizations.dart';
import 'package:popular_movies/utils/error_utils.dart';
import 'package:popular_movies/ui/common/movie_item.dart' as ui;

class MovieListItem extends StatelessWidget {
  final ListItem listItem;
  final Function onRetry;

  const MovieListItem(this.listItem, this.onRetry);

  @override
  Widget build(BuildContext context) {
    if (listItem is MovieItem) {
      final MovieItem item = listItem;
      return ui.MovieItem(item.movie);
    } else if (listItem is LoadingItem) {
      return const Center(child: CircularProgressIndicator());
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
