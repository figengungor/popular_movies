import 'dart:async';
import 'dart:collection';

import 'package:popular_movies/bloc/tagged_images_bloc/tagged_images_repository.dart';
import 'package:popular_movies/model/tagged_image.dart';
import 'package:popular_movies/model/tagged_images.dart';
import 'package:rxdart/rxdart.dart';

class TaggedImagesBloc {
  final TaggedImagesRepository _taggedImagesRepository;

  TaggedImagesBloc({TaggedImagesRepository taggedImagesRepository})
      : _taggedImagesRepository =
            taggedImagesRepository ?? TaggedImagesRepository() {
    _personIdController.stream.listen((personId) {
      getTaggedImages(personId);
    });
  }

  //Output Streams
  Stream<UnmodifiableListView<TaggedImage>> get taggedImages =>
      _taggedImagesSubject.stream;

  Stream<bool> get isLoading => _isLoadingSubject.stream;

  //Input Streams
  Sink<int> get personIdSink => _personIdController.sink;

  //StreamControllers
  final _taggedImagesSubject =
      BehaviorSubject<UnmodifiableListView<TaggedImage>>();
  final _personIdController = StreamController<int>();

  final _isLoadingSubject = BehaviorSubject<bool>();

  void getTaggedImages(int personId) async {
    _isLoadingSubject.add(true);
    try {
      TaggedImages taggedImages =
          await _taggedImagesRepository.getTaggedImages(personId);
      _taggedImagesSubject.add(UnmodifiableListView(taggedImages.results));
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
