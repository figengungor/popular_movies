import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/list_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:popular_movies/data/api_constants.dart';
import 'package:popular_movies/utils/error_utils.dart';

class MovieListItem extends StatelessWidget {
  final ListItem listItem;
  final Function onRetry;

  MovieListItem(this.listItem, this.onRetry);

  @override
  Widget build(BuildContext context) {
    switch (listItem.runtimeType) {
      case MovieItem:
        {
          MovieItem item = listItem;
          return _getMovieItem(context, item);
        }
      case LoadingItem:
        {
          return Center(child: CircularProgressIndicator());
        }

      case LoadingFailed:
        {
          LoadingFailed item = listItem;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  ErrorUtils.getFriendlyNetworkErrorMessage(item.error),
                  textAlign: TextAlign.center,
                ),
                FlatButton(
                  onPressed: onRetry,
                  child: Text('RETRY'),
                )
              ],
            ),
          );
        }

      default:
        throw Exception("${listItem.runtimeType} isn't supported!");
    }
  }

  Widget _getMovieItem(BuildContext context, MovieItem movieItem) {
    String url = "$imageUrl$pathPosterW342${movieItem.movie.posterPath}";
    double imageWidth = MediaQuery.of(context).size.width / 2;
    return Tooltip(
      message: movieItem.movie.title,
      child: CachedNetworkImage(
        placeholder: Image.asset('assets/images/placeholder_poster.png'),
        errorWidget: Stack(
          children: <Widget>[
            Image.asset('assets/images/error_poster.png'),
            Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                movieItem.movie.title,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        imageUrl: url,
        width: imageWidth,
        fit: BoxFit.cover,
      ),
    );
  }
}
