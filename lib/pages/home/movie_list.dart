import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/movie_bloc/list_item.dart';
import 'package:popular_movies/bloc/movie_bloc/movie_bloc.dart';
import 'package:popular_movies/pages/home/movie_list_item.dart';

class MovieList extends StatefulWidget {
  final MovieBloc bloc;
  final List<ListItem> movies;

  MovieList(this.bloc, this.movies, {Key key}) : super(key: key);

  @override
  _MovieListState createState() {
    print("------createState: MovieList");
    return _MovieListState();
  }
}

class _MovieListState extends State<MovieList> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    print("------initState: MovieList");
    _scrollController.addListener(_handleNextPageLoading);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleNextPageLoading);
    _scrollController.dispose();
    super.dispose();
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
        key: widget.key,
        controller: _scrollController,
        itemCount: widget.movies.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieListItem(widget.movies[index], _onRetry);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
        ),
      ),
    );
  }

  void _handleNextPageLoading() {
    //Start loading next page when visible content 500 pixels close
    //to end of the scroll.
    if (_scrollController.position.extentAfter < 500) {
      widget.bloc.nextPageSink.add(null);
    }
  }

  void _onRetry() {
    widget.bloc.nextPageRetrySink.add(null);
  }
}
