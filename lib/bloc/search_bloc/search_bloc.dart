import 'dart:async';
import 'dart:collection';

import 'package:popular_movies/bloc/search_bloc/search_repository.dart';
import 'package:popular_movies/bloc/settings_bloc/settings_repository.dart';
import 'package:popular_movies/model/list_item.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:popular_movies/model/movie_response.dart';
import 'package:rxdart/rxdart.dart';

/// Streams to three StreamBuilders
///
/// * One for ListView (if data is fetched and has data, listView is displayed
/// with data)
///
/// * One for Loading (Display progress while fetching data, hide when operation
/// done)
///
/// * One for ViewStatus (If query is empty, display ViewStatus.Empty.
/// If data is fetched and data is empty, display ViewStatus.NotFound.
/// If data is fetched and data has data, display ViewStatus.None)
///

enum ViewStatus { Empty, NotFound, None }

class SearchBloc {
  SearchBloc(this._searchRepository, this._settingsRepository) {
    _querySubject.stream
        .debounce(Duration(milliseconds: 400))
        .distinct()
        .listen((String query) {
      _searchMoviesFirstPage(query);
    });

    _nextPageController.stream.listen((_) {
      _getNextPageMovies();
    });

    _nextPageRetryController.stream.listen((_) {
      _retryLoadingNextPage();
    });

    _refreshController.stream.listen((Completer<void> completer) {
      _searchMoviesFirstPage(_query, refreshCompleter: completer);
    });

    _settingsRepository.contentLanguage.listen((String contentLanguage) {
      if (_query.isNotEmpty) {
        _searchMoviesFirstPage(_query);
      }
    });
  }

  final SearchRepository _searchRepository;
  final SettingsRepository _settingsRepository;

  //Output Streams
  Stream<UnmodifiableListView<ListItem>> get movies => _moviesSubject.stream;

  Stream<bool> get isLoading => _isLoadingSubject.stream;

  Stream<ViewStatus> get viewStatus => _viewStatusSubject.stream;

  //Input Streams
  Sink<String> get querySink => _querySubject.sink;

  Sink<void> get nextPageSink => _nextPageController.sink;

  Sink<void> get nextPageRetrySink => _nextPageRetryController.sink;

  Sink<Completer<void>> get refreshSink => _refreshController.sink;

  //Stream Controllers
  final PublishSubject<String> _querySubject = PublishSubject<String>();

  final StreamController<void> _nextPageController = StreamController<void>();

  final StreamController<void> _nextPageRetryController =
      StreamController<void>();

  final StreamController<Completer<void>> _refreshController =
      StreamController<Completer<void>>();

  final BehaviorSubject<UnmodifiableListView<ListItem>> _moviesSubject =
      BehaviorSubject<UnmodifiableListView<ListItem>>();

  final BehaviorSubject<bool> _isLoadingSubject = BehaviorSubject<bool>();

  final BehaviorSubject<ViewStatus> _viewStatusSubject =
      BehaviorSubject<ViewStatus>();

  final List<ListItem> _listItems = <ListItem>[];
  int _page = 1;
  int _totalPages;
  bool _isNextLoading = false;
  String _query = '';

  //bloc user should call this method when widget is disposed
  void dispose() {
    _querySubject.close();
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

  Future<void> _searchMoviesFirstPage(String query,
      {Completer<void> refreshCompleter}) async {
    _query = query;
    _page = 1;
    _isNextLoading = false;
    _listItems.clear();

    if (query.isEmpty) {
      _moviesSubject.add(UnmodifiableListView<ListItem>(_listItems));
      _viewStatusSubject.add(ViewStatus.Empty);
      return;
    }

    _viewStatusSubject.add(ViewStatus.None);

    final String language = await _settingsRepository.getContentLanguage();
    if (refreshCompleter == null) {
      _isLoadingSubject.add(true);
    }

    try {
      final MovieResponse movieResponse =
          await _searchRepository.getMovies(query, _page, language);
      _totalPages = movieResponse.totalPages;
      _listItems.addAll(
          movieResponse.movie.toList().map((Movie movie) => MovieItem(movie)));
      _page++;
      _moviesSubject.add(UnmodifiableListView<ListItem>(_listItems));
      if (_listItems.isEmpty) {
        _viewStatusSubject.add(ViewStatus.NotFound);
      } else {
        _viewStatusSubject.add(ViewStatus.None);
      }
    } catch (error) {
      print('ERROR: ${error.toString()}');
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
  Future<void> _getNextPageMovies() async {
    if (!_isNextLoading) {
      _isNextLoading = true;
      if (_totalPages != null && _totalPages >= _page) {
        final String language = await _settingsRepository.getContentLanguage();
        _listItems.add(LoadingItem());
        _moviesSubject.add(UnmodifiableListView<ListItem>(_listItems));
        try {
          final MovieResponse movieResponse =
              await _searchRepository.getMovies(_query, _page, language);
          _listItems.removeLast();
          _listItems.addAll(
              movieResponse.movie.toList().map((Movie movie) => MovieItem(movie)));
          _page++;
          _moviesSubject.add(UnmodifiableListView<ListItem>(_listItems));
          _isNextLoading = false;
        } catch (error) {
          print('ERROR: ${error.toString()}');
          _listItems.removeLast();
          _listItems.add(LoadingFailed(error));
          _moviesSubject.add(UnmodifiableListView<ListItem>(_listItems));
        }
      }
    }
  }

  /// RefreshIndicator should pass this function to its onRefresh property
  /// To know about the completion status
  Future<void> refresh() {
    print('Refresh is called');
    final Completer<void> completer = Completer<void>();
    refreshSink.add(completer);
    return completer.future;
  }

  bool isListEmpty() {
    return _listItems.isEmpty;
  }

  bool isQueryEmpty() {
    return _query.isEmpty;
  }
}
