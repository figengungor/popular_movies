import 'dart:async';

import 'package:popular_movies/bloc/movie_detail_bloc/movie_detail_repository.dart';
import 'package:popular_movies/model/movie_detail.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc {
  //Output Streams
  Stream<MovieDetail> get movieDetail => _movieDetailSubject.stream;

  //Input Streams
  Sink<int> get movieIdSink => _movieIdController.sink;

  //Stream Controllers
  final _movieDetailSubject = BehaviorSubject<MovieDetail>();

  final _movieIdController = StreamController<int>();

  MovieDetailBloc(MovieDetailRepository movieDetailRepository) {
    _movieIdController.stream.listen((movieId) {
      _getMovieDetail(movieDetailRepository, movieId);
    });
  }

  dispose() {
    _movieIdController.close();
  }

  void _getMovieDetail(
      MovieDetailRepository movieDetailRepository, int movieId) async {
    try {
      MovieDetail movieDetail =
          await movieDetailRepository.getMovieDetail(movieId);
      _movieDetailSubject.add(movieDetail);
    } catch (error) {
      _movieDetailSubject.addError(error);
    }
  }
}
