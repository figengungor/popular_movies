library review;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/serializers.dart';

part 'review.g.dart';

abstract class Review implements Built<Review, ReviewBuilder> {
  Review._();

  factory Review([updates(ReviewBuilder b)]) = _$Review;

  @BuiltValueField(wireName: 'author')
  String get author;

  @BuiltValueField(wireName: 'content')
  String get content;

  @BuiltValueField(wireName: 'id')
  String get id;

  @BuiltValueField(wireName: 'url')
  String get url;

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Review.serializer, this));
  }

  static Review fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        Review.serializer, json.decode(jsonString));
  }

  static Serializer<Review> get serializer => _$reviewSerializer;
}
