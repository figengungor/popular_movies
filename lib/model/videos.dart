library videos;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/serializers.dart';
import 'package:popular_movies/model/video.dart';

part 'videos.g.dart';

abstract class Videos implements Built<Videos, VideosBuilder> {
  Videos._();

  factory Videos([updates(VideosBuilder b)]) = _$Videos;

  @BuiltValueField(wireName: 'results')
  BuiltList<Video> get results;

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Videos.serializer, this));
  }

  static Videos fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        Videos.serializer, json.decode(jsonString));
  }

  static Serializer<Videos> get serializer => _$videosSerializer;
}
