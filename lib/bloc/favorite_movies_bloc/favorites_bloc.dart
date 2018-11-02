import 'dart:async';
import 'dart:collection';

import 'package:popular_movies/bloc/favorite_movies_bloc/favorites_repository.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:rxdart/rxdart.dart';

class FavoritesBloc {
  final FavoritesRepository favoritesRepository;

  FavoritesBloc(this.favoritesRepository) {
    _updateMoviesController.stream.listen((_) {
      _getFavoriteMovies();
    });

    favoritesRepository.isUpdated.listen((_) {
      _getFavoriteMovies();
    });
  }

  //Output Streams
  Stream<UnmodifiableListView<Movie>> get movies => _moviesSubject.stream;

  //Input Streams
  Sink<void> get updateMoviesSink => _updateMoviesController.sink;

  //StreamControllers

  final BehaviorSubject<UnmodifiableListView<Movie>> _moviesSubject = BehaviorSubject<UnmodifiableListView<Movie>>();
  final StreamController<void> _updateMoviesController = StreamController<void>();

  Future<void> _getFavoriteMovies() async {
    final List<Movie> movies = await favoritesRepository.getFavoriteMovies();
    _moviesSubject.add(UnmodifiableListView<Movie>(movies));
  }

  void dispose() {
    _updateMoviesController.close();
  }
}
