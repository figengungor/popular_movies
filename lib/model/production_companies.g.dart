// GENERATED CODE - DO NOT MODIFY BY HAND

part of production_companies;

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

Serializer<ProductionCompanies> _$productionCompaniesSerializer =
    new _$ProductionCompaniesSerializer();

class _$ProductionCompaniesSerializer
    implements StructuredSerializer<ProductionCompanies> {
  @override
  final Iterable<Type> types = const [
    ProductionCompanies,
    _$ProductionCompanies
  ];
  @override
  final String wireName = 'ProductionCompanies';

  @override
  Iterable serialize(Serializers serializers, ProductionCompanies object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'origin_country',
      serializers.serialize(object.originCountry,
          specifiedType: const FullType(String)),
    ];
    if (object.logoPath != null) {
      result
        ..add('logo_path')
        ..add(serializers.serialize(object.logoPath,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  ProductionCompanies deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ProductionCompaniesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'logo_path':
          result.logoPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'origin_country':
          result.originCountry = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductionCompanies extends ProductionCompanies {
  @override
  final int id;
  @override
  final String logoPath;
  @override
  final String name;
  @override
  final String originCountry;

  factory _$ProductionCompanies([void updates(ProductionCompaniesBuilder b)]) =>
      (new ProductionCompaniesBuilder()..update(updates)).build();

  _$ProductionCompanies._(
      {this.id, this.logoPath, this.name, this.originCountry})
      : super._() {
    if (id == null)
      throw new BuiltValueNullFieldError('ProductionCompanies', 'id');
    if (name == null)
      throw new BuiltValueNullFieldError('ProductionCompanies', 'name');
    if (originCountry == null)
      throw new BuiltValueNullFieldError(
          'ProductionCompanies', 'originCountry');
  }

  @override
  ProductionCompanies rebuild(void updates(ProductionCompaniesBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductionCompaniesBuilder toBuilder() =>
      new ProductionCompaniesBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ProductionCompanies) return false;
    return id == other.id &&
        logoPath == other.logoPath &&
        name == other.name &&
        originCountry == other.originCountry;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), logoPath.hashCode), name.hashCode),
        originCountry.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductionCompanies')
          ..add('id', id)
          ..add('logoPath', logoPath)
          ..add('name', name)
          ..add('originCountry', originCountry))
        .toString();
  }
}

class ProductionCompaniesBuilder
    implements Builder<ProductionCompanies, ProductionCompaniesBuilder> {
  _$ProductionCompanies _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _logoPath;
  String get logoPath => _$this._logoPath;
  set logoPath(String logoPath) => _$this._logoPath = logoPath;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _originCountry;
  String get originCountry => _$this._originCountry;
  set originCountry(String originCountry) =>
      _$this._originCountry = originCountry;

  ProductionCompaniesBuilder();

  ProductionCompaniesBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _logoPath = _$v.logoPath;
      _name = _$v.name;
      _originCountry = _$v.originCountry;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductionCompanies other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$ProductionCompanies;
  }

  @override
  void update(void updates(ProductionCompaniesBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductionCompanies build() {
    final _$result = _$v ??
        new _$ProductionCompanies._(
            id: id,
            logoPath: logoPath,
            name: name,
            originCountry: originCountry);
    replace(_$result);
    return _$result;
  }
}
