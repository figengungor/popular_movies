// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'en';

  static m0(name) => "by ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appTitle" : MessageLookupByLibrary.simpleMessage("Popular Movies"),
    "byName" : m0,
    "castTitle" : MessageLookupByLibrary.simpleMessage("Cast"),
    "connectionTimeOutError" : MessageLookupByLibrary.simpleMessage("Connection timeout."),
    "directorsTitle" : MessageLookupByLibrary.simpleMessage("Directors"),
    "favoritesTitle" : MessageLookupByLibrary.simpleMessage("Favorites"),
    "movieDetailFetchError" : MessageLookupByLibrary.simpleMessage("Movie details couldn\'t be fetched.\n\n"),
    "noCastFound" : MessageLookupByLibrary.simpleMessage("No cast found"),
    "noFavoritesFound" : MessageLookupByLibrary.simpleMessage("No favorites found!"),
    "noInternetError" : MessageLookupByLibrary.simpleMessage("You have no Internet."),
    "noReviewsFound" : MessageLookupByLibrary.simpleMessage("No reviews found"),
    "noSimilarMoviesFound" : MessageLookupByLibrary.simpleMessage("No similar movies found"),
    "noVideosFound" : MessageLookupByLibrary.simpleMessage("No videos found"),
    "nowPlayingTitle" : MessageLookupByLibrary.simpleMessage("Now Playing"),
    "popularTitle" : MessageLookupByLibrary.simpleMessage("Popular"),
    "retry" : MessageLookupByLibrary.simpleMessage("Retry"),
    "reviewsTitle" : MessageLookupByLibrary.simpleMessage("Reviews"),
    "seeMore" : MessageLookupByLibrary.simpleMessage("See more"),
    "similarMovies" : MessageLookupByLibrary.simpleMessage("Similar Movies"),
    "taggedImages" : MessageLookupByLibrary.simpleMessage("Tagged Images"),
    "topRatedTitle" : MessageLookupByLibrary.simpleMessage("Top Rated"),
    "videosTitle" : MessageLookupByLibrary.simpleMessage("Videos"),
    "writersTitle" : MessageLookupByLibrary.simpleMessage("Writers")
  };
}
