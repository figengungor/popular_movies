import 'dart:async';
import 'dart:collection';

import 'package:popular_movies/bloc/settings_bloc/settings_repository.dart';
import 'package:popular_movies/bloc/tagged_images_bloc/tagged_images_repository.dart';
import 'package:popular_movies/model/tagged_image.dart';
import 'package:popular_movies/model/tagged_images.dart';
import 'package:rxdart/rxdart.dart';

class TaggedImagesBloc {
  TaggedImagesBloc(this._settingsRepository,
      {TaggedImagesRepository taggedImagesRepository})
      : _taggedImagesRepository =
            taggedImagesRepository ?? TaggedImagesRepository() {
    _personIdController.stream.listen((int personId) {
      getTaggedImages(personId);
    });
  }

  final TaggedImagesRepository _taggedImagesRepository;
  final SettingsRepository _settingsRepository;

  //Output Streams
  Stream<UnmodifiableListView<TaggedImage>> get taggedImages =>
      _taggedImagesSubject.stream;

  Stream<bool> get isLoading => _isLoadingSubject.stream;

  //Input Streams
  Sink<int> get personIdSink => _personIdController.sink;

  //StreamControllers
  final BehaviorSubject<UnmodifiableListView<TaggedImage>> _taggedImagesSubject =
      BehaviorSubject<UnmodifiableListView<TaggedImage>>();

  final StreamController<int> _personIdController = StreamController<int>();

  final BehaviorSubject<bool> _isLoadingSubject = BehaviorSubject<bool>();

  Future<void> getTaggedImages(int personId) async {
    _isLoadingSubject.add(true);
    try {
      final String language = await _settingsRepository.getContentLanguage();
      final TaggedImages taggedImages =
          await _taggedImagesRepository.getTaggedImages(personId, language);
      _taggedImagesSubject.add(UnmodifiableListView<TaggedImage>(taggedImages.results));
    } catch (error) {
      _taggedImagesSubject.addError(error);
    } finally {
      _isLoadingSubject.add(false);
    }
  }

  void dispose() {
    _personIdController.close();
  }
}
