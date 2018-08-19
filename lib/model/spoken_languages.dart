library spoken_languages;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/serializers.dart';

part 'spoken_languages.g.dart';

abstract class SpokenLanguages
    implements Built<SpokenLanguages, SpokenLanguagesBuilder> {
  SpokenLanguages._();

  factory SpokenLanguages([updates(SpokenLanguagesBuilder b)]) =
      _$SpokenLanguages;

  @BuiltValueField(wireName: 'iso_639_1')
  String get iso6391;

  @BuiltValueField(wireName: 'name')
  String get name;

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(SpokenLanguages.serializer, this));
  }

  static SpokenLanguages fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        SpokenLanguages.serializer, json.decode(jsonString));
  }

  static Serializer<SpokenLanguages> get serializer =>
      _$spokenLanguagesSerializer;
}
