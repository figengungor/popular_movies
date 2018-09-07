import 'dart:async';

import 'package:popular_movies/data/tmdb_api.dart';
import 'package:popular_movies/model/movie_response.dart';

class SearchRepository {
  TmdbApi _tmdbApi;

  SearchRepository({TmdbApi tmdbApi}) : _tmdbApi = tmdbApi ?? TmdbApi();

  Future<MovieResponse> getMovies(String query, int page, String language) async {
    MovieResponse movieResponse = await _tmdbApi.searchMovies(query, page, language);
    return movieResponse;
  }
}
