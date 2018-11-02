import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class MoviePreferences {
  static const String keyContentLanguage = 'contentLanguage';
  static const String defaultContentLanguage = 'en';

  Future<String> getContentLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyContentLanguage) ?? defaultContentLanguage;
  }

  Future<bool> setContentLanguage(String contentLanguage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(keyContentLanguage, contentLanguage);
  }
}
