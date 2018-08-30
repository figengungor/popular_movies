library person_detail;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/external_ids.dart';
import 'package:popular_movies/model/serializers.dart';

part 'person_detail.g.dart';

abstract class PersonDetail
    implements Built<PersonDetail, PersonDetailBuilder> {
  PersonDetail._();

  factory PersonDetail([updates(PersonDetailBuilder b)]) = _$PersonDetail;

  @BuiltValueField(wireName: 'birthday')
  @nullable
  String get birthday;

  @BuiltValueField(wireName: 'known_for_department')
  String get knownForDepartment;

  @BuiltValueField(wireName: 'deathday')
  @nullable
  String get deathday;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'external_ids')
  ExternalIds get externalIds;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'also_known_as')
  BuiltList<String> get alsoKnownAs;

  @BuiltValueField(wireName: 'gender')
  int get gender;

  @BuiltValueField(wireName: 'biography')
  String get biography;

  @BuiltValueField(wireName: 'popularity')
  double get popularity;

  @BuiltValueField(wireName: 'place_of_birth')
  @nullable
  String get placeOfBirth;

  @BuiltValueField(wireName: 'profile_path')
  @nullable
  String get profilePath;

  @BuiltValueField(wireName: 'adult')
  bool get adult;

  @BuiltValueField(wireName: 'imdb_id')
  String get imdbId;

  @BuiltValueField(wireName: 'homepage')
  @nullable
  String get homepage;

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(PersonDetail.serializer, this));
  }

  static PersonDetail fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        PersonDetail.serializer, json.decode(jsonString));
  }

  static Serializer<PersonDetail> get serializer => _$personDetailSerializer;
}
