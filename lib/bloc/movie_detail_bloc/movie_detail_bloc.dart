import 'dart:async';

import 'package:popular_movies/bloc/movie_detail_bloc/movie_detail_repository.dart';
import 'package:popular_movies/bloc/settings_bloc/settings_repository.dart';
import 'package:popular_movies/model/movie_detail.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc {
  MovieDetailBloc(
      this._movieId, this._movieDetailRepository, this._settingsRepository) {
    _fetchMovieDetailController.stream.listen((_) {
      _getMovieDetail();
    });

    _settingsRepository.contentLanguage.listen((String language) {
      _getMovieDetail();
    });
  }
  MovieDetailRepository _movieDetailRepository;
  SettingsRepository _settingsRepository;
  int _movieId;

  //Output Streams
  Stream<MovieDetail> get movieDetail => _movieDetailSubject.stream;

  //Input Streams
  Sink<void> get fetchMovieDetailSink => _fetchMovieDetailController.sink;

  //Stream Controllers
  final BehaviorSubject<MovieDetail> _movieDetailSubject = BehaviorSubject<MovieDetail>();

  final StreamController<void> _fetchMovieDetailController = StreamController<void>();

  void dispose() {
    _fetchMovieDetailController.close();
  }

  Future<void> _getMovieDetail() async {
    try {
      final String language = await _settingsRepository.getContentLanguage();
      final MovieDetail movieDetail =
          await _movieDetailRepository.getMovieDetail(_movieId, language);
      _movieDetailSubject.add(movieDetail);
    } catch (error) {
      _movieDetailSubject.addError(error);
    }
  }
}
