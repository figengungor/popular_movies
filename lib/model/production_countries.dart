library production_countries;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/serializers.dart';

part 'production_countries.g.dart';

abstract class ProductionCountries
    implements Built<ProductionCountries, ProductionCountriesBuilder> {
  ProductionCountries._();

  factory ProductionCountries([updates(ProductionCountriesBuilder b)]) =
      _$ProductionCountries;

  @BuiltValueField(wireName: 'iso_3166_1')
  String get iso31661;

  @BuiltValueField(wireName: 'name')
  String get name;

  String toJson() {
    return json.encode(standardSerializers.serializeWith(
        ProductionCountries.serializer, this));
  }

  static ProductionCountries fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        ProductionCountries.serializer, json.decode(jsonString));
  }

  static Serializer<ProductionCountries> get serializer =>
      _$productionCountriesSerializer;
}
