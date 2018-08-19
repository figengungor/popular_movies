// GENERATED CODE - DO NOT MODIFY BY HAND

part of production_countries;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

Serializer<ProductionCountries> _$productionCountriesSerializer =
    new _$ProductionCountriesSerializer();

class _$ProductionCountriesSerializer
    implements StructuredSerializer<ProductionCountries> {
  @override
  final Iterable<Type> types = const [
    ProductionCountries,
    _$ProductionCountries
  ];
  @override
  final String wireName = 'ProductionCountries';

  @override
  Iterable serialize(Serializers serializers, ProductionCountries object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'iso_3166_1',
      serializers.serialize(object.iso31661,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ProductionCountries deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ProductionCountriesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'iso_3166_1':
          result.iso31661 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductionCountries extends ProductionCountries {
  @override
  final String iso31661;
  @override
  final String name;

  factory _$ProductionCountries([void updates(ProductionCountriesBuilder b)]) =>
      (new ProductionCountriesBuilder()..update(updates)).build();

  _$ProductionCountries._({this.iso31661, this.name}) : super._() {
    if (iso31661 == null)
      throw new BuiltValueNullFieldError('ProductionCountries', 'iso31661');
    if (name == null)
      throw new BuiltValueNullFieldError('ProductionCountries', 'name');
  }

  @override
  ProductionCountries rebuild(void updates(ProductionCountriesBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductionCountriesBuilder toBuilder() =>
      new ProductionCountriesBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ProductionCountries) return false;
    return iso31661 == other.iso31661 && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, iso31661.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductionCountries')
          ..add('iso31661', iso31661)
          ..add('name', name))
        .toString();
  }
}

class ProductionCountriesBuilder
    implements Builder<ProductionCountries, ProductionCountriesBuilder> {
  _$ProductionCountries _$v;

  String _iso31661;
  String get iso31661 => _$this._iso31661;
  set iso31661(String iso31661) => _$this._iso31661 = iso31661;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ProductionCountriesBuilder();

  ProductionCountriesBuilder get _$this {
    if (_$v != null) {
      _iso31661 = _$v.iso31661;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductionCountries other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$ProductionCountries;
  }

  @override
  void update(void updates(ProductionCountriesBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductionCountries build() {
    final _$result =
        _$v ?? new _$ProductionCountries._(iso31661: iso31661, name: name);
    replace(_$result);
    return _$result;
  }
}
