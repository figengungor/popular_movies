import 'dart:async';

import 'package:popular_movies/data/movie_preferences.dart';
import 'package:rxdart/rxdart.dart';

class SettingsRepository {
  final MoviePreferences _moviePreferences;

  SettingsRepository({MoviePreferences moviePreferences})
      : _moviePreferences = moviePreferences ?? MoviePreferences();

  Future<String> getContentLanguage() async {
    String contentLanguage = await _moviePreferences.getContentLanguage();
    return contentLanguage;
  }

  Future<bool> setContentLanguage(String contentLanguage) async {
    bool isSuccess =
        await _moviePreferences.setContentLanguage(contentLanguage);
    if (isSuccess) _contentLanguageSubject.add(contentLanguage);
    return isSuccess;
  }

  ///All SettingsRepository users should listen to this stream
  ///to be notified when contentLanguage is changed
  ///so they can update their UIs
  //Output Stream
  Stream<String> get contentLanguage => _contentLanguageSubject.stream;

  //StreamController
  final _contentLanguageSubject = BehaviorSubject<String>();
}
