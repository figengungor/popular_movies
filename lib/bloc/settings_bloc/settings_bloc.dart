import 'dart:async';

import 'package:popular_movies/bloc/settings_bloc/settings_repository.dart';
import 'package:rxdart/rxdart.dart';

class SettingsBloc {
  SettingsBloc(SettingsRepository settingsRepository)
      : _settingsRepository = settingsRepository ?? SettingsRepository() {
    _contentLanguageController.stream.listen((String contentLanguage) {
      _updateContentLanguage(contentLanguage);
    });
  }
  final SettingsRepository _settingsRepository;

  Stream<String> get contentLanguage => _contentLanguageSubject.stream;

  final BehaviorSubject<String> _contentLanguageSubject = BehaviorSubject<String>();

  Sink<String> get contentLanguageSink => _contentLanguageController.sink;

  final StreamController<String> _contentLanguageController = StreamController<String>();

  void _updateContentLanguage(String contentLanguage) {
    _settingsRepository.setContentLanguage(contentLanguage);
    _contentLanguageSubject.add(contentLanguage);
  }

  Future<void> getContentLanguage() async {
    final String contentLanguage = await _settingsRepository.getContentLanguage();
    _contentLanguageSubject.add(contentLanguage);
  }

  void dispose() {
    _contentLanguageController.close();
  }
}
