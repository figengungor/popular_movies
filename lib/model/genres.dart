library genres;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/serializers.dart';

part 'genres.g.dart';

abstract class Genres implements Built<Genres, GenresBuilder> {
  Genres._();

  factory Genres([updates(GenresBuilder b)]) = _$Genres;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Genres.serializer, this));
  }

  static Genres fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        Genres.serializer, json.decode(jsonString));
  }

  static Serializer<Genres> get serializer => _$genresSerializer;
}
