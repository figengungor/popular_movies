library tagged_image;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/serializers.dart';

part 'tagged_image.g.dart';

abstract class TaggedImage implements Built<TaggedImage, TaggedImageBuilder> {
  TaggedImage._();

  factory TaggedImage([updates(TaggedImageBuilder b)]) = _$TaggedImage;

  @BuiltValueField(wireName: 'aspect_ratio')
  double get aspectRatio;

  @BuiltValueField(wireName: 'file_path')
  String get filePath;

  @BuiltValueField(wireName: 'height')
  int get height;

  @BuiltValueField(wireName: 'iso_639_1')
  @nullable
  String get iso6391;

  @BuiltValueField(wireName: 'vote_average')
  double get voteAverage;

  @BuiltValueField(wireName: 'vote_count')
  int get voteCount;

  @BuiltValueField(wireName: 'width')
  int get width;

  @BuiltValueField(wireName: 'media')
  JsonObject get media;

  @BuiltValueField(wireName: 'media_type')
  String get mediaType;

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(TaggedImage.serializer, this));
  }

  static TaggedImage fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        TaggedImage.serializer, json.decode(jsonString));
  }

  static Serializer<TaggedImage> get serializer => _$taggedImageSerializer;
}
