import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/movie_bloc/list_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:popular_movies/data/api_constants.dart';
import 'package:popular_movies/inherited_widgets/favorite_repo_provider.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:popular_movies/pages/movie_detail/movie_detail_page.dart';
import 'package:popular_movies/utils/error_utils.dart';

class MovieListItem extends StatelessWidget {
  final ListItem listItem;
  final Function onRetry;

  MovieListItem(this.listItem, this.onRetry);

  @override
  Widget build(BuildContext context) {
    if (listItem is MovieItem) {
      MovieItem item = listItem;
      return _getMovieItem(context, item);
    } else if (listItem is LoadingItem) {
      return Center(child: CircularProgressIndicator());
    } else if (listItem is LoadingFailed) {
      LoadingFailed item = listItem;
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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

  Widget _getMovieItem(BuildContext context, MovieItem movieItem) {
    String url = "$imageUrl$pathPosterW342${movieItem.movie.posterPath}";
    double imageWidth = MediaQuery.of(context).size.width / 2;
    return GestureDetector(
      onTap: () {
        _openMovieDetailPage(context, movieItem.movie);
      },
      child: Tooltip(
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
      ),
    );
  }

  void _openMovieDetailPage(BuildContext context, Movie movie) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return MovieDetailPage(movie,FavoriteRepoProvider.of(context).favoritesRepository);
    }));
  }
}
