import 'dart:async';

import 'package:popular_movies/data/movie_database.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:rxdart/rxdart.dart';

class FavoritesRepository {

  final MovieDatabase _movieDatabase;

  FavoritesRepository({MovieDatabase movieDatabase})
      : _movieDatabase = movieDatabase ?? MovieDatabase();

  Future<List<Movie>> getFavoriteMovies() async {
    return _movieDatabase.getFavorites();
  }

  Future<Movie> getFavorite(int movieId) async {
    return _movieDatabase.getFavoriteById(movieId);
  }

  Future<int> removeFavorite(int movieId) async {
    int row = await _movieDatabase.deleteFavorite(movieId);
    _updateSubject.add(true);
    return row;
  }

  Future<int> addFavorite(Movie movie) async {
    int id = await _movieDatabase.saveFavorite(movie);
    _updateSubject.add(true);
    return id;
  }

  //Output
  Stream<bool> get isUpdated => _updateSubject.stream;

  final _updateSubject = BehaviorSubject<bool>(seedValue: false);

}
