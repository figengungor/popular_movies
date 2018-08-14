import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/movie_bloc.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:popular_movies/model/movie_type.dart';
import 'package:popular_movies/pages/common/error_message.dart';
import 'package:popular_movies/pages/home/movie_list.dart';

class HomePage extends StatefulWidget {
  final MovieBloc bloc;

  HomePage({this.bloc});

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    widget.bloc.moviesType.add(MovieType.Popular);
    super.initState();
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  void _loadBottomNavigationBarItemContent(int index) {
    if (index == 0) {
      widget.bloc.moviesType.add(MovieType.Popular);
    } else if (index == 1) {
      widget.bloc.moviesType.add(MovieType.TopRated);
    } else {
      widget.bloc.moviesType.add(MovieType.NowPlaying);
    }
  }

  void _onRetry() {
    _loadBottomNavigationBarItemContent(_currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _loadBottomNavigationBarItemContent(index);
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Popular')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Top Rated')),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow), title: Text('Now Playing')),
        ],
      ),
      body: Stack(
        children: <Widget>[
          StreamBuilder<UnmodifiableListView<Movie>>(
              initialData: UnmodifiableListView<Movie>([]),
              stream: widget.bloc.movies,
              builder: (BuildContext context,
                  AsyncSnapshot<UnmodifiableListView<Movie>> snapshot) {
                if (snapshot.hasData) {
                  return MovieList(snapshot.data);
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
      ),
    );
  }
}
