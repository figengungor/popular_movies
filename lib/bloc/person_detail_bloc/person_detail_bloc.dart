import 'dart:async';

import 'package:popular_movies/bloc/person_detail_bloc/person_detail_repository.dart';
import 'package:popular_movies/bloc/settings_bloc/settings_repository.dart';
import 'package:popular_movies/model/person_detail.dart';
import 'package:rxdart/rxdart.dart';

class PersonDetailBloc {
  final PersonDetailRepository _personDetailRepository;
  final SettingsRepository _settingsRepository;

  PersonDetailBloc(this._settingsRepository,
      {PersonDetailRepository personDetailRepository})
      : _personDetailRepository =
            personDetailRepository ?? PersonDetailRepository() {
    _personIdController.stream.listen((personId) {
      getPersonDetail(personId);
    });
  }

  //Output Streams
  Stream<PersonDetail> get personDetail => _personDetailSubject.stream;

  Stream<bool> get isLoading => _isLoadingSubject.stream;

  //Input Streams
  Sink<int> get personIdSink => _personIdController.sink;

  //StreamControllers

  final _personDetailSubject = BehaviorSubject<PersonDetail>();
  final _personIdController = StreamController<int>();
  final _isLoadingSubject = BehaviorSubject<bool>();

  void getPersonDetail(int personId) async {
    _isLoadingSubject.add(true);
    try {
      String language = await _settingsRepository.getContentLanguage();
      PersonDetail personDetail =
          await _personDetailRepository.getPersonDetail(personId, language);
      _personDetailSubject.add(personDetail);
    } catch (error) {
      _personDetailSubject.addError(error);
    } finally {
      _isLoadingSubject.add(false);
    }
  }

  void dispose() {
    _personIdController.close();
  }
}
