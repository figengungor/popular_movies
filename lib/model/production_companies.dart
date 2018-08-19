library production_companies;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:popular_movies/model/serializers.dart';

part 'production_companies.g.dart';

abstract class ProductionCompanies
    implements Built<ProductionCompanies, ProductionCompaniesBuilder> {
  ProductionCompanies._();

  factory ProductionCompanies([updates(ProductionCompaniesBuilder b)]) =
      _$ProductionCompanies;

  @BuiltValueField(wireName: 'id')
  int get id;

  @BuiltValueField(wireName: 'logo_path')
  @nullable
  String get logoPath;

  @BuiltValueField(wireName: 'name')
  String get name;

  @BuiltValueField(wireName: 'origin_country')
  String get originCountry;

  String toJson() {
    return json.encode(standardSerializers.serializeWith(
        ProductionCompanies.serializer, this));
  }

  static ProductionCompanies fromJson(String jsonString) {
    return standardSerializers.deserializeWith(
        ProductionCompanies.serializer, json.decode(jsonString));
  }

  static Serializer<ProductionCompanies> get serializer =>
      _$productionCompaniesSerializer;
}
