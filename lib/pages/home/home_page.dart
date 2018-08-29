import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/favorite_movies_bloc/favorites_bloc.dart';
import 'package:popular_movies/bloc/favorite_movies_bloc/favorites_repository.dart';
import 'package:popular_movies/bloc/movie_bloc/movie_bloc.dart';
import 'package:popular_movies/bloc/movie_bloc/movie_repository.dart';
import 'package:popular_movies/model/movie_type.dart';
import 'package:popular_movies/pages/home/favorites_page.dart';
import 'package:popular_movies/pages/home/movie_page.dart';

class HomePage extends StatefulWidget {
  final FavoritesRepository repo;

  const HomePage({Key key, this.repo}) : super(key: key);

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
  FavoritesBloc _favoritesBloc;

  @override
  void initState() {
    _popularBloc = MovieBloc(MovieRepository(movieType: MovieType.Popular));
    _topRatedBloc = MovieBloc(MovieRepository(movieType: MovieType.TopRated));
    _nowPlayingBloc =
        MovieBloc(MovieRepository(movieType: MovieType.NowPlaying));
    _favoritesBloc = FavoritesBloc(widget.repo);
    super.initState();
  }


  @override
  void dispose() {
    _popularBloc.dispose();
    _topRatedBloc.dispose();
    _nowPlayingBloc.dispose();
    _favoritesBloc.dispose();
    super.dispose();
  }

  Widget _loadBottomNavigationBarItemContent(int index) {
    if (index == 0) {
      return MoviePage(_popularBloc, key: PageStorageKey('popularKey'));
    } else if (index == 1) {
      return MoviePage(_topRatedBloc, key: PageStorageKey('topRatedKey'));
    } else if(index==2){
      return MoviePage(_nowPlayingBloc, key: PageStorageKey('nowPlayingKey'));
    } else {
      return FavoritesPage(_favoritesBloc, key: PageStorageKey('favoritesKey'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _loadBottomNavigationBarItemContent(index);
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), title: Text('Popular')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Top Rated')),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow), title: Text('Now Playing')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favorites')),
        ],
      ),
      body: _loadBottomNavigationBarItemContent(_currentIndex),
    );
  }
}
