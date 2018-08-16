import 'package:popular_movies/model/movie.dart';

class ListItem {}

class MovieItem extends ListItem {
  final Movie movie;
  MovieItem(this.movie);
}

class LoadingItem extends ListItem {}

class LoadingFailed extends ListItem {
  final dynamic error;
  LoadingFailed(this.error);
}
