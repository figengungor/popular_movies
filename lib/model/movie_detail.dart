library movie_detail;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/belongs_to_collection.dart';
import 'package:popular_movies/model/credits.dart';
import 'package:popular_movies/model/genres.dart';
import 'package:popular_movies/model/production_companies.dart';
import 'package:popular_movies/model/production_countries.dart';
import 'package:popular_movies/model/reviews.dart';
import 'package:popular_movies/model/serializers.dart';
import 'package:popular_movies/model/similar.dart';
import 'package:popular_movies/model/spoken_languages.dart';
import 'package:popular_movies/model/videos.dart';

part 'movie_detail.g.dart';

abstract class MovieDetail implements Built<MovieDetail, MovieDetailBuilder> {
  MovieDetail._();

  factory MovieDetail([updates(MovieDetailBuilder b)]) = _$MovieDetail;

  @BuiltValueField(wireName: 'adult')
  bool get adult;

  @BuiltValueField(wireName: 'backdrop_path')
  @nullable
  String get backdropPath;

  @BuiltValueField(wireName: 'belongs_to_collection')
  @nullable
  BelongsToCollection get belongsToCollection;

  @BuiltValueField(wireName: 'budget')
  int get budget;

  @BuiltValueField(wireName: 'genres')
  BuiltList<Genres> get genres;

  @BuiltValueField(wireName: 'homepage')
  @nullable
  String get homepage;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'imdb_id')
  @nullable
  String get imdbId;

  @BuiltValueField(wireName: 'original_language')
  String get originalLanguage;

  @BuiltValueField(wireName: 'original_title')
  String get originalTitle;

  @BuiltValueField(wireName: 'overview')
  @nullable
  String get overview;

  @BuiltValueField(wireName: 'popularity')
  double get popularity;

  @BuiltValueField(wireName: 'poster_path')
  @nullable
  String get posterPath;

  @BuiltValueField(wireName: 'production_companies')
  BuiltList<ProductionCompanies> get productionCompanies;

  @BuiltValueField(wireName: 'production_countries')
  BuiltList<ProductionCountries> get productionCountries;

  @BuiltValueField(wireName: 'release_date')
  String get releaseDate;

  @BuiltValueField(wireName: 'revenue')
  int get revenue;

  @BuiltValueField(wireName: 'runtime')
  @nullable
  int get runtime;

  @BuiltValueField(wireName: 'spoken_languages')
  BuiltList<SpokenLanguages> get spokenLanguages;

  @BuiltValueField(wireName: 'status')
  String get status;

  @BuiltValueField(wireName: 'tagline')
  @nullable
  String get tagline;

  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'video')
  bool get video;

  @BuiltValueField(wireName: 'vote_average')
  double get voteAverage;

  @BuiltValueField(wireName: 'vote_count')
  int get voteCount;

  @BuiltValueField(wireName: 'videos')
  Videos get videos;

  @BuiltValueField(wireName: 'reviews')
  @nullable
  Reviews get reviews;

  @BuiltValueField(wireName: 'credits')
  Credits get credits;

  @BuiltValueField(wireName: 'similar')
  Similar get similar;

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(MovieDetail.serializer, this));
  }

  static MovieDetail fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        MovieDetail.serializer, json.decode(jsonString));
  }

  static Serializer<MovieDetail> get serializer => _$movieDetailSerializer;
}
