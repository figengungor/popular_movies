import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/favorite_movies_bloc/favorites_bloc.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:popular_movies/ui/common/movie_item.dart';

class FavoriteList extends StatefulWidget {
  final FavoritesBloc bloc;
  final List<Movie> movies;

  FavoriteList(this.bloc, this.movies, {Key key}) : super(key: key);

  @override
  _FavoriteListState createState() {
    print("------createState: FavoriteList");
    return _FavoriteListState();
  }
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    print("------build: FavoriteList");
    return GridView.builder(
      key: widget.key,
      itemCount: widget.movies.length,
      itemBuilder: (BuildContext context, int index) {
        return MovieItem(widget.movies[index]);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
      ),
    );
  }
}
