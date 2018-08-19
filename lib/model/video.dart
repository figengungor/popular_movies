library video;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/serializers.dart';

part 'video.g.dart';

abstract class Video implements Built<Video, VideoBuilder> {
  Video._();

  factory Video([updates(VideoBuilder b)]) = _$Video;

  @BuiltValueField(wireName: 'id')
  String get id;

  @BuiltValueField(wireName: 'iso_639_1')
  String get iso6391;

  @BuiltValueField(wireName: 'iso_3166_1')
  String get iso31661;

  @BuiltValueField(wireName: 'key')
  String get key;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'site')
  String get site;

  @BuiltValueField(wireName: 'size')
  int get size;

  @BuiltValueField(wireName: 'type')
  String get type;

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Video.serializer, this));
  }

  static Video fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        Video.serializer, json.decode(jsonString));
  }

  static Serializer<Video> get serializer => _$videoSerializer;
}
