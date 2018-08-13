import 'package:flutter/material.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:popular_movies/pages/home/movie_item.dart';

class MovieList extends StatefulWidget {
  final List<Movie> movies;
  MovieList(this.movies);

  @override
  _MovieListState createState() {
    print("------createState: MovieList");
    return new _MovieListState();
  }
}

class _MovieListState extends State<MovieList> {
  ScrollController _scrollController;

  @override
  void initState() {
    print("------initState: MovieList");
    _scrollController = ScrollController(keepScrollOffset: false);
    super.initState();
  }

  @override
  void didUpdateWidget(MovieList oldWidget) {
    print("------didUpdateWidget: MovieList");
    //Jump the ScrollController to 0.0 when
    //didUpdateWidget is called but delayed until the end-of-frame.
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _scrollController.jumpTo(0.0));
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print("------build: MovieList");
    return GridView.builder(
      controller: _scrollController,
      itemCount: widget.movies.length,
      itemBuilder: (BuildContext context, int index) {
        return MovieItem(widget.movies[index]);
      },
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
      ),
    );
  }
}
