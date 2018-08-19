library credits;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/cast.dart';
import 'package:popular_movies/model/crew.dart';
import 'package:popular_movies/model/serializers.dart';

part 'credits.g.dart';

abstract class Credits implements Built<Credits, CreditsBuilder> {
  Credits._();

  factory Credits([updates(CreditsBuilder b)]) = _$Credits;

  @BuiltValueField(wireName: 'cast')
  BuiltList<Cast> get cast;

  @BuiltValueField(wireName: 'crew')
  BuiltList<Crew> get crew;

  String toJson() {
    return json
        .encode(standardSerializers.serializeWith(Credits.serializer, this));
  }

  static Credits fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        Credits.serializer, json.decode(jsonString));
  }

  static Serializer<Credits> get serializer => _$creditsSerializer;
}
