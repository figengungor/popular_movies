import 'dart:async';
import 'package:popular_movies/bloc/favorite_movies_bloc/favorites_repository.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:rxdart/rxdart.dart';

class FavoriteBloc {
  final FavoritesRepository favoritesRepository;
  final Movie movie;
  bool isFavorite;

  FavoriteBloc(this.favoritesRepository, this.movie) {
    _checkStatusController.stream.listen((_) {
      _checkStatus();
    });

    _updateStatusController.stream.listen((_) {
      _updateStatus();
    });

    favoritesRepository.isUpdated.listen((_) {
      _checkStatus();
    });
  }

  //Output Streams
  Stream<bool> get status => _statusSubject.stream;

  //InputStream
  Sink<void> get updateStatusSink => _updateStatusController.sink;
  Sink<void> get checkStatusSink => _checkStatusController.sink;

  //StreamControllers
  final _statusSubject = BehaviorSubject<bool>(seedValue: false);
  final _updateStatusController = StreamController<void>();
  final _checkStatusController = StreamController<void>();

  void _checkStatus() async {
    Movie favoriteMovie = await favoritesRepository.getFavorite(movie.id);
    isFavorite = favoriteMovie == null ? false : true;
    _statusSubject.add(isFavorite);
  }

  void _updateStatus() async {
    if (isFavorite) {
      _removeFavorite();
    } else {
      _addFavorite();
    }
    isFavorite = !isFavorite;
    _statusSubject.add(isFavorite);
  }

  void dispose() {
    _updateStatusController.close();
    _checkStatusController.close();
  }

  void _removeFavorite() async {
    await favoritesRepository.removeFavorite(movie.id);
  }

  void _addFavorite() async {
    await favoritesRepository.addFavorite(movie);
  }
}
