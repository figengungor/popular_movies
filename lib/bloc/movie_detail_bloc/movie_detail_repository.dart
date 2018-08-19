import 'dart:async';

import 'package:popular_movies/data/tmdb_api.dart';
import 'package:popular_movies/model/movie_detail.dart';

class MovieDetailRepository {
  final TmdbApi _tmdbApi;

  MovieDetailRepository({TmdbApi tmdbApi}) : _tmdbApi = tmdbApi ?? TmdbApi();

  Future<MovieDetail> getMovieDetail(int movieId) async {
    MovieDetail movieDetail = await _tmdbApi.fetchMovieDetail(movieId);
    return movieDetail;
  }
}
