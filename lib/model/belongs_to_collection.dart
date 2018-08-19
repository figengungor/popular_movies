library belongs_to_collection;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/serializers.dart';

part 'belongs_to_collection.g.dart';

abstract class BelongsToCollection
    implements Built<BelongsToCollection, BelongsToCollectionBuilder> {
  BelongsToCollection._();

  factory BelongsToCollection([updates(BelongsToCollectionBuilder b)]) =
      _$BelongsToCollection;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'poster_path')
  @nullable
  String get posterPath;

  @BuiltValueField(wireName: 'backdrop_path')
  @nullable
  String get backdropPath;

  String toJson() {
    return json.encode(standardSerializers.serializeWith(
        BelongsToCollection.serializer, this));
  }

  static BelongsToCollection fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        BelongsToCollection.serializer, json.decode(jsonString));
  }

  static Serializer<BelongsToCollection> get serializer =>
      _$belongsToCollectionSerializer;
}
