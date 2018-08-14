import 'dart:async';
import 'package:popular_movies/data/tmdb_api.dart';
import 'package:popular_movies/model/movie_response.dart';
import 'package:popular_movies/model/movie_type.dart';

class MovieRepository {
  final TmdbApi _tmdbApi;
  final MoviesCache _moviesCache;

  MovieRepository({tmdbApi, moviesCache})
      : this._tmdbApi = tmdbApi ?? TmdbApi(),
        this._moviesCache = moviesCache ?? MoviesCache();

  Future<MovieResponse> getMovies(MovieType movieType) async {
    if (_moviesCache.contains(movieType)) {
      print("$movieType coming from cache");
      return _moviesCache.get(movieType);
    } else {
      MovieResponse movieResponse = await _tmdbApi.fetchMovies(movieType);
      print("$movieType is fetched from api");
      _moviesCache.add(movieType, movieResponse);
      return movieResponse;
    }
  }
}

class MoviesCache {
  final Map<MovieType, MovieResponse> _moviesCache;

  MoviesCache({Map<MovieType, MovieResponse> moviesCache})
      : this._moviesCache = moviesCache ?? <MovieType, MovieResponse>{};

  Map<MovieType, MovieResponse> get moviesCache => _moviesCache;

  bool contains(MovieType movieType) {
    return _moviesCache.containsKey(movieType);
  }

  void add(MovieType type, MovieResponse movieResponse) {
    _moviesCache[type] = movieResponse;
  }

  MovieResponse get(MovieType movieType) {
    return _moviesCache[movieType];
  }
}
