library movie;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/serializers.dart';

part 'movie.g.dart';

abstract class Movie implements Built<Movie, MovieBuilder> {
  Movie._();

  factory Movie([updates(MovieBuilder b)]) = _$Movie;

  @BuiltValueField(wireName: 'vote_count')
  int get voteCount;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'video')
  bool get video;

  @BuiltValueField(wireName: 'vote_average')
  double get voteAverage;

  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'popularity')
  double get popularity;

  @nullable
  @BuiltValueField(wireName: 'poster_path')
  String get posterPath;

  @BuiltValueField(wireName: 'original_language')
  String get originalLanguage;

  @BuiltValueField(wireName: 'original_title')
  String get originalTitle;

  @nullable
  @BuiltValueField(wireName: 'genre_ids')
  BuiltList<int> get genreIds;

  @nullable
  @BuiltValueField(wireName: 'backdrop_path')
  String get backdropPath;

  @BuiltValueField(wireName: 'adult')
  bool get adult;

  @BuiltValueField(wireName: 'overview')
  String get overview;

  @BuiltValueField(wireName: 'release_date')
  String get releaseDate;

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Movie.serializer, this));
  }

  static Movie fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        Movie.serializer, json.decode(jsonString));
  }

  Map<String, dynamic> toDbValues() {
    return {
      'id': id,
      'poster_path': posterPath,
      'adult': adult ? 1 : 0,
      'overview': overview,
      'release_date': releaseDate,
      'original_title': originalTitle,
      'original_language': originalLanguage,
      'title': title,
      'backdrop_path': backdropPath,
      'popularity': popularity,
      'vote_count': voteCount,
      'video': video ? 1 : 0,
      'vote_average': voteAverage
    };
  }

  static Movie fromDbValues(Map<String, dynamic> map) {
    return Movie((b) => b
      ..id = map['id']
      ..posterPath = map['poster_path']
      ..adult = map['adult'] == 1 ? true : false
      ..overview = map['overview']
      ..releaseDate = map['release_date']
      ..originalTitle = map['original_title']
      ..originalLanguage = map['original_language']
      ..title = map['title']
      ..backdropPath = map['backdrop_path']
      ..popularity = map['popularity']
      ..voteCount = map['vote_count']
      ..video = map['video'] == 1 ? true : false
      ..voteAverage = map['vote_average']);
  }

  static Serializer<Movie> get serializer => _$movieSerializer;
}
