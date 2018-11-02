import 'dart:async';
import 'dart:collection';
import 'package:popular_movies/model/list_item.dart';
import 'package:popular_movies/bloc/movie_bloc/movie_repository.dart';
import 'package:popular_movies/bloc/settings_bloc/settings_repository.dart';
import 'package:popular_movies/model/movie_response.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final MovieRepository _movieRepository;
  final SettingsRepository _settingsRepository;

  //Output Streams
  Stream<UnmodifiableListView<ListItem>> get movies => _moviesSubject.stream;

  Stream<bool> get isLoading => _isLoadingSubject.stream;

  //Input Streams
  Sink<void> get firstPageSink => _firstPageController.sink;

  Sink<void> get nextPageSink => _nextPageController.sink;

  Sink<void> get nextPageRetrySink => _nextPageRetryController.sink;

  Sink<Completer<Null>> get refreshSink => _refreshController.sink;

  //Stream Controllers
  final _firstPageController = StreamController<void>();

  final _nextPageController = StreamController<void>();

  final _nextPageRetryController = StreamController<void>();

  final _refreshController = StreamController<Completer<Null>>();

  final _moviesSubject = BehaviorSubject<UnmodifiableListView<ListItem>>();

  final _isLoadingSubject = BehaviorSubject<bool>();

  List<ListItem> _listItems = <ListItem>[];
  int _page = 1;
  int _totalPages;
  bool _isNextLoading = false;

  MovieBloc(this._movieRepository, this._settingsRepository) {
    _firstPageController.stream.listen((_) {
      _getFirstPageMovies();
    });

    _nextPageController.stream.listen((_) {
      _getNextPageMovies();
    });

    _nextPageRetryController.stream.listen((_) {
      _retryLoadingNextPage();
    });

    _refreshController.stream.listen((completer) {
      _getFirstPageMovies(refreshCompleter: completer);
    });

    _settingsRepository.contentLanguage.listen((String contentLanguage) {
      _movieRepository.clearCache();
      _getFirstPageMovies();
    });
  }

  //bloc user should call this method when widget is disposed
  void dispose() {
    _firstPageController.close();
    _nextPageController.close();
    _nextPageRetryController.close();
    _refreshController.close();
  }

  // If refreshCompleter is provided, that means user trigger RefreshIndicator
  // In that case RefreshIndicator's progress is displayed, no need to display
  // our first page loading progress indicator.

  // The cache is also cleared when refreshed.

  // The refreshCompleter should call complete method to let RefreshIndicator
  // know that we're done with our background work.

  void _getFirstPageMovies({Completer<Null> refreshCompleter}) async {
    print('getFirstPageMovies is called---------');
    String language = await _settingsRepository.getContentLanguage();
    if (refreshCompleter != null) {
      _movieRepository.clearCache();
    } else {
      _isLoadingSubject.add(true);
    }
    _page = 1;
    //to stop next page loading when first page is being loaded
    //only make it false if first page is fetched successfully
    _isNextLoading = true;
    _listItems.clear();
    _moviesSubject.add(UnmodifiableListView(_listItems));

    try {
      MovieResponse movieResponse =
          await _movieRepository.getMovies(_page, language);
      _totalPages = movieResponse.totalPages;
      _listItems.addAll(
          movieResponse.movie.toList().map((movie) => MovieItem(movie)));
      _page++;
      _moviesSubject.add(UnmodifiableListView(_listItems));
      _isNextLoading = false;
    } catch (error) {
      print("ERROR: ${error.toString()}");
      _moviesSubject.addError(error);
    } finally {
      if (refreshCompleter != null) {
        refreshCompleter.complete();
      } else {
        _isLoadingSubject.add(false);
      }
    }
  }

  // If retry request coming from LoadingFailed item which is the last item
  // in the _listItems, this method is called.
  // First, LoadingFailed item is removed from the list.
  // Then _isNextLoading is set to false to retry again.

  void _retryLoadingNextPage() {
    _listItems.removeLast();
    _isNextLoading = false;
    _getNextPageMovies();
  }

  // Check the status of next page loading with _isNextLoading bool
  // To avoid making new requests before this one finishes.
  void _getNextPageMovies() async {
    print('getNextPageMovies is called---------');
    if (!_isNextLoading) {
      _isNextLoading = true;
      if (_totalPages != null && _totalPages >= _page) {
        String language = await _settingsRepository.getContentLanguage();
        _listItems.add(LoadingItem());
        _moviesSubject.add(UnmodifiableListView(_listItems));
        //Couldn't see the loading so just add some delay
        //to see if it's working as intended
        /* await Future.delayed(Duration(seconds: 2), () {
          return null;
        });*/
        try {
          MovieResponse movieResponse =
              await _movieRepository.getMovies(_page, language);
          _listItems.removeLast();
          _listItems.addAll(
              movieResponse.movie.toList().map((movie) => MovieItem(movie)));
          _page++;
          _moviesSubject.add(UnmodifiableListView(_listItems));
          _isNextLoading = false;
        } catch (error) {
          print("ERROR: ${error.toString()}");
          _listItems.removeLast();
          _listItems.add(LoadingFailed(error));
          _moviesSubject.add(UnmodifiableListView(_listItems));
        }
      }
    }
  }

  /// RefreshIndicator should pass this function to its onRefresh property
  /// To know about the completion status
  Future<Null> refresh() {
    print('Refresh is called');
    final completer = Completer<Null>();
    refreshSink.add(completer);
    return completer.future;
  }

  bool isListEmpty() {
    return _listItems.isEmpty;
  }
}
