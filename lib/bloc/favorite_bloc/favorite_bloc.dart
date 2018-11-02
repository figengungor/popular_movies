import 'dart:async';
import 'package:popular_movies/bloc/favorite_movies_bloc/favorites_repository.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:rxdart/rxdart.dart';

class FavoriteBloc {
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

  final FavoritesRepository favoritesRepository;
  final Movie movie;
  bool isFavorite;

  //Output Streams
  Stream<bool> get status => _statusSubject.stream;

  //InputStream
  Sink<void> get updateStatusSink => _updateStatusController.sink;
  Sink<void> get checkStatusSink => _checkStatusController.sink;

  //StreamControllers
  final BehaviorSubject<bool> _statusSubject = BehaviorSubject<bool>(seedValue: false);
  final StreamController<void> _updateStatusController = StreamController<void>();
  final StreamController<void> _checkStatusController = StreamController<void>();

  Future<void> _checkStatus() async {
    final Movie favoriteMovie = await favoritesRepository.getFavorite(movie.id);
    isFavorite = favoriteMovie == null ? false : true;
    _statusSubject.add(isFavorite);
  }

  Future<void> _updateStatus() async {
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

  Future<void> _removeFavorite() async {
    await favoritesRepository.removeFavorite(movie.id);
  }

  Future<void> _addFavorite() async {
    await favoritesRepository.addFavorite(movie);
  }
}
