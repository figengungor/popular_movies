import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/list_item.dart';
import 'package:popular_movies/bloc/movie_bloc.dart';
import 'package:popular_movies/pages/common/error_message.dart';
import 'package:popular_movies/pages/home/movie_list.dart';

class MoviePage extends StatefulWidget {
  final MovieBloc bloc;

  MoviePage(this.bloc, {Key key}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  void initState() {
    widget.bloc.firstPageSink.add(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        StreamBuilder<UnmodifiableListView<ListItem>>(
            initialData: UnmodifiableListView<ListItem>([]),
            stream: widget.bloc.movies,
            builder: (BuildContext context,
                AsyncSnapshot<UnmodifiableListView<ListItem>> snapshot) {
              if (snapshot.hasData) {
                return MovieList(widget.bloc, snapshot.data);
              } else if (snapshot.hasError) {
                return ErrorMessage(
                  snapshot.error,
                  onRetry: _onRetry,
                );
              }
            }),
        StreamBuilder(
            initialData: false,
            stream: widget.bloc.isLoading,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              return snapshot.data
                  ? Center(child: CircularProgressIndicator())
                  : Container();
            }),
      ],
    );
  }

  void _onRetry() {
    widget.bloc.firstPageSink.add(null);
  }
}
