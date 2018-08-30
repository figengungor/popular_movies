library tagged_images;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/serializers.dart';
import 'package:popular_movies/model/tagged_image.dart';

part 'tagged_images.g.dart';

abstract class TaggedImages
    implements Built<TaggedImages, TaggedImagesBuilder> {
  TaggedImages._();

  factory TaggedImages([updates(TaggedImagesBuilder b)]) = _$TaggedImages;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'page')
  int get page;

  @BuiltValueField(wireName: 'results')
  BuiltList<TaggedImage> get results;

  @BuiltValueField(wireName: 'total_pages')
  int get totalPages;

  @BuiltValueField(wireName: 'total_results')
  int get totalResults;

  String toJson() {
    return json.encode(
        standardSerializers.serializeWith(TaggedImages.serializer, this));
  }

  static TaggedImages fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        TaggedImages.serializer, json.decode(jsonString));
  }

  static Serializer<TaggedImages> get serializer => _$taggedImagesSerializer;
}
