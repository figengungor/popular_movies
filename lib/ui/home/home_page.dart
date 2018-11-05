import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/favorite_movies_bloc/favorites_bloc.dart';
import 'package:popular_movies/bloc/favorite_movies_bloc/favorites_repository.dart';
import 'package:popular_movies/bloc/movie_bloc/movie_bloc.dart';
import 'package:popular_movies/bloc/movie_bloc/movie_repository.dart';
import 'package:popular_movies/bloc/settings_bloc/settings_bloc.dart';
import 'package:popular_movies/bloc/settings_bloc/settings_repository.dart';
import 'package:popular_movies/l10n/localizations.dart';
import 'package:popular_movies/model/movie_type.dart';
import 'package:popular_movies/ui/common/language_setting.dart';
import 'package:popular_movies/ui/common/search_action.dart';
import 'package:popular_movies/ui/home/favorites_page.dart';
import 'package:popular_movies/ui/home/movie_page.dart';

class HomePage extends StatefulWidget {
  final FavoritesRepository repo;
  final SettingsRepository settingsRepository;

  const HomePage({Key key, this.repo, this.settingsRepository})
      : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  MovieBloc _popularBloc;
  MovieBloc _topRatedBloc;
  MovieBloc _nowPlayingBloc;
  FavoritesBloc _favoritesBloc;
  SettingsBloc _settingsBloc;

  @override
  void initState() {
    _popularBloc = MovieBloc(MovieRepository(movieType: MovieType.Popular),
        widget.settingsRepository);
    _topRatedBloc = MovieBloc(MovieRepository(movieType: MovieType.TopRated),
        widget.settingsRepository);
    _nowPlayingBloc = MovieBloc(
        MovieRepository(movieType: MovieType.NowPlaying),
        widget.settingsRepository);
    _favoritesBloc = FavoritesBloc(widget.repo);
    _settingsBloc = SettingsBloc(widget.settingsRepository);
    super.initState();
  }

  @override
  void dispose() {
    _popularBloc.dispose();
    _topRatedBloc.dispose();
    _nowPlayingBloc.dispose();
    _favoritesBloc.dispose();
    _settingsBloc.dispose();
    super.dispose();
  }

  Widget _loadBottomNavigationBarItemContent(int index) {
    if (index == 0) {
      return MoviePage(_popularBloc, key: const PageStorageKey<String>('popularKey'));
    } else if (index == 1) {
      return MoviePage(_topRatedBloc, key: const PageStorageKey<String>('topRatedKey'));
    } else if (index == 2) {
      return MoviePage(_nowPlayingBloc, key: const PageStorageKey<String>('nowPlayingKey'));
    } else {
      return FavoritesPage(_favoritesBloc, key: const PageStorageKey<String>('favoritesKey'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).appTitle,
        ),
        actions: <Widget>[
          SearchAction(),
          LanguageSetting(_settingsBloc),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          _loadBottomNavigationBarItemContent(index);
        },
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.trending_up),
            title: Text(AppLocalizations.of(context).popularTitle),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            title: Text(AppLocalizations.of(context).topRatedTitle),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.play_arrow),
            title: Text(AppLocalizations.of(context).nowPlayingTitle),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            title: Text(AppLocalizations.of(context).favoritesTitle),
          ),
        ],
      ),
      body: _loadBottomNavigationBarItemContent(_currentIndex),
    );
  }
}
