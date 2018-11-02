import 'dart:async';

import 'package:popular_movies/data/tmdb_api.dart';
import 'package:popular_movies/model/tagged_images.dart';

class TaggedImagesRepository {
  TaggedImagesRepository({TmdbApi tmdbApi}) : _tmdbApi = tmdbApi ?? TmdbApi();
  final TmdbApi _tmdbApi;

  Future<TaggedImages> getTaggedImages(int personId, String language) async {
    return _tmdbApi.fetchTaggedImages(personId, language);
  }
}
