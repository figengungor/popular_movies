import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/movie_bloc/list_item.dart';
import 'package:popular_movies/bloc/movie_bloc/movie_bloc.dart';
import 'package:popular_movies/pages/home/movie_list_item.dart';

class MovieList extends StatefulWidget {
  final MovieBloc bloc;
  final List<ListItem> movies;
  MovieList(this.bloc, this.movies);

  @override
  _MovieListState createState() {
    print("------createState: MovieList");
    return new _MovieListState();
  }
}

class _MovieListState extends State<MovieList> {
  ScrollController _scrollController = new ScrollController();

  void _onRetry() {
    widget.bloc.nextPageRetrySink.add(null);
  }

  @override
  void initState() {
    print("------initState: MovieList");
    //_scrollController = ScrollController(keepScrollOffset: false);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        widget.bloc.nextPageSink.add(null);
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(MovieList oldWidget) {
    print("------didUpdateWidget: MovieList");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print("------build: MovieList");
    return RefreshIndicator(
      onRefresh: widget.bloc.refresh,
      child: GridView.builder(
        controller: _scrollController,
        itemCount: widget.movies.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieListItem(widget.movies[index], _onRetry);
        },
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
        ),
      ),
    );
  }
}
