library similar;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:popular_movies/model/serializers.dart';

part 'similar.g.dart';

abstract class Similar implements Built<Similar, SimilarBuilder> {
  Similar._();

  factory Similar([updates(SimilarBuilder b)]) = _$Similar;

  @BuiltValueField(wireName: 'page')
  int get page;
  @BuiltValueField(wireName: 'results')
  BuiltList<Movie> get results;
  @BuiltValueField(wireName: 'total_pages')
  int get totalPages;
  @BuiltValueField(wireName: 'total_results')
  int get totalResults;
  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Similar.serializer, this));
  }

  static Similar fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        Similar.serializer, json.decode(jsonString));
  }

  static Serializer<Similar> get serializer => _$similarSerializer;
}
