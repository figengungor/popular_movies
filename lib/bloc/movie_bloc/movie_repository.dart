import 'dart:async';
import 'package:meta/meta.dart';
import 'package:popular_movies/data/tmdb_api.dart';
import 'package:popular_movies/model/movie_response.dart';
import 'package:popular_movies/model/movie_type.dart';

class MovieRepository {
  final TmdbApi _tmdbApi;
  final MoviesCache _moviesCache;
  final MovieType _movieType;

  MovieRepository(
      {TmdbApi tmdbApi, MoviesCache moviesCache, @required MovieType movieType})
      : this._tmdbApi = tmdbApi ?? TmdbApi(),
        this._moviesCache = moviesCache ?? MoviesCache(),
        this._movieType = movieType;

  Future<MovieResponse> getMovies(int page, String language) async {
    if (_moviesCache.contains(page)) {
      print("$_movieType coming from cache");
      return _moviesCache.get(page);
    } else {
      MovieResponse movieResponse =
          await _tmdbApi.fetchMovies(_movieType, page, language);
      print("$_movieType is fetched from api");
      _moviesCache.add(page, movieResponse);
      return movieResponse;
    }
  }

  void clearCache() {
    _moviesCache.clear();
  }
}

class MoviesCache {
  final Map<int, MovieResponse> _moviesCache;

  MoviesCache({Map<int, MovieResponse> moviesCache})
      : this._moviesCache = moviesCache ?? <int, MovieResponse>{};

  Map<int, MovieResponse> get moviesCache => _moviesCache;

  bool contains(int page) {
    return _moviesCache.containsKey(page);
  }

  void add(int page, MovieResponse movieResponse) {
    _moviesCache[page] = movieResponse;
  }

  MovieResponse get(int page) {
    return _moviesCache[page];
  }

  void clear() {
    _moviesCache.clear();
  }
}
