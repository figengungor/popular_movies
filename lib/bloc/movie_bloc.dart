import 'dart:async';
import 'dart:collection';
import 'package:popular_movies/bloc/movie_repository.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:popular_movies/model/movie_response.dart';
import 'package:popular_movies/model/movie_type.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  //Output Streams
  Stream<UnmodifiableListView<Movie>> get movies => _moviesSubject.stream;

  Stream<bool> get isLoading => _isLoadingSubject.stream;

  //Input Streams
  Sink<MovieType> get moviesType => _movieTypeController.sink;

  //Stream Controllers
  final _movieTypeController = StreamController<MovieType>();

  final _moviesSubject = BehaviorSubject<UnmodifiableListView<Movie>>();

  final _isLoadingSubject = BehaviorSubject<bool>();

  MovieBloc(MovieRepository movieRepository) {
    //Listen movieType changes and update movies stream
    _movieTypeController.stream.listen((movieType) {
      _getMoviesAndUpdate(movieType, movieRepository);
    });
  }
  //bloc user should call this method when widget is disposed
  dispose() {
    _movieTypeController.close();
  }

  void _getMoviesAndUpdate(
      MovieType movieType, MovieRepository movieRepository) async {
    _isLoadingSubject.add(true);
    try {
      MovieResponse movieResponse = await movieRepository.getMovies(movieType);
      _moviesSubject.add(UnmodifiableListView(movieResponse.movie.toList()));
    } catch (error) {
      print("ERROR: ${error.toString()}");
      _moviesSubject.addError(error);
    }
    _isLoadingSubject.add(false);
  }
}
