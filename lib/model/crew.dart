library crew;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/serializers.dart';

part 'crew.g.dart';

abstract class Crew implements Built<Crew, CrewBuilder> {
  Crew._();

  factory Crew([updates(CrewBuilder b)]) = _$Crew;

  @BuiltValueField(wireName: 'credit_id')
  String get creditId;

  @BuiltValueField(wireName: 'department')
  String get department;

  @BuiltValueField(wireName: 'gender')
  int get gender;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'job')
  String get job;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'profile_path')
  @nullable
  String get profilePath;

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Crew.serializer, this));
  }

  static Crew fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        Crew.serializer, json.decode(jsonString));
  }

  static Serializer<Crew> get serializer => _$crewSerializer;
}
