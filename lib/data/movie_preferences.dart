import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class MoviePreferences {
  static const keyContentLanguage = "contentLanguage";
  static const defaultContentLanguage = "en";

  Future<String> getContentLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyContentLanguage) ?? defaultContentLanguage;
  }

  Future<bool> setContentLanguage(String contentLanguage) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(keyContentLanguage, contentLanguage);
  }
}
