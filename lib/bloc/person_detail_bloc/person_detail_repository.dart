import 'dart:async';

import 'package:popular_movies/data/tmdb_api.dart';
import 'package:popular_movies/model/person_detail.dart';

class PersonDetailRepository {
  final TmdbApi _tmdbApi;

  PersonDetailRepository({TmdbApi tmdbApi}) : _tmdbApi = tmdbApi ?? TmdbApi();

  Future<PersonDetail> getPersonDetail(int personId, String language) async {
    return _tmdbApi.fetchPersonDetail(personId, language);
  }
}
