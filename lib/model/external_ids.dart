library external_ids;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/serializers.dart';

part 'external_ids.g.dart';

abstract class ExternalIds implements Built<ExternalIds, ExternalIdsBuilder> {
  ExternalIds._();

  factory ExternalIds([updates(ExternalIdsBuilder b)]) = _$ExternalIds;

  @BuiltValueField(wireName: 'freebase_id')
  @nullable
  String get freebaseId;

  @BuiltValueField(wireName: 'instagram_id')
  @nullable
  String get instagramId;

  @BuiltValueField(wireName: 'tvrage_id')
  @nullable
  int get tvrageId;

  @BuiltValueField(wireName: 'twitter_id')
  @nullable
  String get twitterId;

  @BuiltValueField(wireName: 'freebase_mid')
  @nullable
  String get freebaseMid;

  @BuiltValueField(wireName: 'imdb_id')
  @nullable
  String get imdbId;

  @BuiltValueField(wireName: 'facebook_id')
  @nullable
  String get facebookId;

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(ExternalIds.serializer, this));
  }

  static ExternalIds fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        ExternalIds.serializer, json.decode(jsonString));
  }

  static Serializer<ExternalIds> get serializer => _$externalIdsSerializer;
}
