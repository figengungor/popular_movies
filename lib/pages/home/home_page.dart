import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/movie_bloc.dart';
import 'package:popular_movies/bloc/movie_repository.dart';
import 'package:popular_movies/model/movie_type.dart';
import 'package:popular_movies/pages/home/movie_page.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  MovieBloc _popularBloc;
  MovieBloc _topRatedBloc;
  MovieBloc _nowPlayingBloc;

  @override
  void initState() {
    _popularBloc = MovieBloc(MovieRepository(movieType: MovieType.Popular));
    _topRatedBloc = MovieBloc(MovieRepository(movieType: MovieType.TopRated));
    _nowPlayingBloc =
        MovieBloc(MovieRepository(movieType: MovieType.NowPlaying));
    super.initState();
  }

  @override
  void dispose() {
    _popularBloc.dispose();
    _topRatedBloc.dispose();
    _nowPlayingBloc.dispose();
    super.dispose();
  }

  Widget _loadBottomNavigationBarItemContent(int index) {
    if (index == 0) {
      return MoviePage(_popularBloc, key: Key("1"));
    } else if (index == 1) {
      return MoviePage(_topRatedBloc, key: Key("2"));
    } else {
      return MoviePage(_nowPlayingBloc, key: Key("3"));
    }
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
      body: _loadBottomNavigationBarItemContent(_currentIndex),
    );
  }
}
