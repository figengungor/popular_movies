library cast;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/serializers.dart';

part 'cast.g.dart';

abstract class Cast implements Built<Cast, CastBuilder> {
  Cast._();

  factory Cast([updates(CastBuilder b)]) = _$Cast;

  @BuiltValueField(wireName: 'cast_id')
  int get castId;

  @BuiltValueField(wireName: 'character')
  String get character;

  @BuiltValueField(wireName: 'credit_id')
  String get creditId;

  @BuiltValueField(wireName: 'gender')
  int get gender;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'order')
  int get order;

  @BuiltValueField(wireName: 'profile_path')
  @nullable
  String get profilePath;

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Cast.serializer, this));
  }

  static Cast fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        Cast.serializer, json.decode(jsonString));
  }

  static Serializer<Cast> get serializer => _$castSerializer;
}
