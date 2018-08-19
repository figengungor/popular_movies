library reviews;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/review.dart';
import 'package:popular_movies/model/serializers.dart';

part 'reviews.g.dart';

abstract class Reviews implements Built<Reviews, ReviewsBuilder> {
  Reviews._();

  factory Reviews([updates(ReviewsBuilder b)]) = _$Reviews;

  @BuiltValueField(wireName: 'page')
  int get page;

  @BuiltValueField(wireName: 'results')
  BuiltList<Review> get results;

  @BuiltValueField(wireName: 'total_pages')
  int get totalPages;

  @BuiltValueField(wireName: 'total_results')
  int get totalResults;

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Reviews.serializer, this));
  }

  static Reviews fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        Reviews.serializer, json.decode(jsonString));
  }

  static Serializer<Reviews> get serializer => _$reviewsSerializer;
}
