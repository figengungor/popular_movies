import 'dart:collection';
import 'package:confused_travolta_error_view/confused_travolta_error_view.dart';
import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/favorite_movies_bloc/favorites_bloc.dart';
import 'package:popular_movies/bloc/movie_bloc/list_item.dart';
import 'package:popular_movies/bloc/movie_bloc/movie_bloc.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:popular_movies/pages/home/favorite_list.dart';
import 'package:popular_movies/pages/home/movie_list.dart';
import 'package:popular_movies/utils/error_utils.dart';

class FavoritesPage extends StatefulWidget {
  final FavoritesBloc bloc;

  FavoritesPage(this.bloc, {Key key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    widget.bloc.updateMoviesSink.add(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        StreamBuilder<UnmodifiableListView<Movie>>(
            stream: widget.bloc.movies,
            builder: (BuildContext context,
                AsyncSnapshot<UnmodifiableListView<Movie>> snapshot) {
              if (snapshot.hasData) {
                print("Snapshot data ${snapshot.data}  FavoritesPage");
                return FavoriteList(widget.bloc, snapshot.data, key: widget.key);
              } else if (snapshot.hasError) {
                return ConfusedTravoltaErrorView(
                  errorMessage:
                      ErrorUtils.getFriendlyNetworkErrorMessage(snapshot.error),
                  onTapRetryButton: _onRetry,
                );
              } else {
                return Container();
              }
            }),
      ],
    );
  }

  void _onRetry() {
    widget.bloc.updateMoviesSink.add(null);
  }
}
