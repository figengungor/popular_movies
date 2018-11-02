import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'package:popular_movies/l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get appTitle {
    return Intl.message(
      'Popular Movies',
      name: 'appTitle',
      desc: 'The title of the application',
    );
  }

  String get popularTitle {
    return Intl.message(
      'Popular',
      name: 'popularTitle',
      desc: 'The bottom bar item title',
    );
  }

  String get topRatedTitle {
    return Intl.message(
      'Top Rated',
      name: 'topRatedTitle',
      desc: 'The bottom bar item title',
    );
  }

  String get nowPlayingTitle {
    return Intl.message(
      'Now Playing',
      name: 'nowPlayingTitle',
      desc: 'The bottom bar item title',
    );
  }

  String get favoritesTitle {
    return Intl.message(
      'Favorites',
      name: 'favoritesTitle',
      desc: 'The bottom bar item title',
    );
  }

  String get videosTitle {
    return Intl.message(
      'Videos',
      name: 'videosTitle',
    );
  }

  String get reviewsTitle {
    return Intl.message(
      'Reviews',
      name: 'reviewsTitle',
    );
  }

  String get castTitle {
    return Intl.message(
      'Cast',
      name: 'castTitle',
    );
  }

  String get directorsTitle {
    return Intl.message(
      'Directors',
      name: 'directorsTitle',
    );
  }

  String get writersTitle {
    return Intl.message(
      'Writers',
      name: 'writersTitle',
    );
  }

  String get similarMovies {
    return Intl.message(
      'Similar Movies',
      name: 'similarMovies',
    );
  }

  String get taggedImages {
    return Intl.message(
      'Tagged Images',
      name: 'taggedImages',
    );
  }

  String get connectionTimeOutError {
    return Intl.message(
      'Connection timeout.',
      name: 'connectionTimeOutError',
    );
  }

  String get noInternetError {
    return Intl.message(
      'You have no Internet.',
      name: 'noInternetError',
    );
  }

  String get noFavoritesFound {
    return Intl.message(
      'No favorites found!',
      name: 'noFavoritesFound',
    );
  }

  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
    );
  }

  String get noCastFound {
    return Intl.message(
      'No cast found',
      name: 'noCastFound',
    );
  }

  String get noReviewsFound {
    return Intl.message(
      'No reviews found',
      name: 'noReviewsFound',
    );
  }

  String get noSimilarMoviesFound {
    return Intl.message(
      'No similar movies found',
      name: 'noSimilarMoviesFound',
    );
  }

  String get noVideosFound {
    return Intl.message(
      'No videos found',
      name: 'noVideosFound',
    );
  }

  String get movieDetailFetchError {
    return Intl.message(
      'Movie details couldn\'t be fetched.\n\n',
      name: 'movieDetailFetchError',
    );
  }

  String get seeMore {
    return Intl.message(
      'See more',
      name: 'seeMore',
    );
  }

  String byName(String name) => Intl.message(
        'by $name',
        args: <String>[name],
        name: 'byName',
      );

  String get search {
    return Intl.message(
      'Search',
      name: 'search',
    );
  }

  String get searchEmptyViewMessage {
    return Intl.message(
      'Start typing movies to search.',
      name: 'searchEmptyViewMessage',
    );
  }

  String get searchNoDataFoundMessage {
    return Intl.message(
      'No search result found.',
      name: 'searchEmptyViewMessage',
    );
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'tr', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
