// GENERATED CODE - DO NOT MODIFY BY HAND

part of belongs_to_collection;

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

Serializer<BelongsToCollection> _$belongsToCollectionSerializer =
    new _$BelongsToCollectionSerializer();

class _$BelongsToCollectionSerializer
    implements StructuredSerializer<BelongsToCollection> {
  @override
  final Iterable<Type> types = const [
    BelongsToCollection,
    _$BelongsToCollection
  ];
  @override
  final String wireName = 'BelongsToCollection';

  @override
  Iterable serialize(Serializers serializers, BelongsToCollection object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    if (object.posterPath != null) {
      result
        ..add('poster_path')
        ..add(serializers.serialize(object.posterPath,
            specifiedType: const FullType(String)));
    }
    if (object.backdropPath != null) {
      result
        ..add('backdrop_path')
        ..add(serializers.serialize(object.backdropPath,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  BelongsToCollection deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new BelongsToCollectionBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'poster_path':
          result.posterPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'backdrop_path':
          result.backdropPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BelongsToCollection extends BelongsToCollection {
  @override
  final int id;
  @override
  final String name;
  @override
  final String posterPath;
  @override
  final String backdropPath;

  factory _$BelongsToCollection([void updates(BelongsToCollectionBuilder b)]) =>
      (new BelongsToCollectionBuilder()..update(updates)).build();

  _$BelongsToCollection._(
      {this.id, this.name, this.posterPath, this.backdropPath})
      : super._() {
    if (id == null)
      throw new BuiltValueNullFieldError('BelongsToCollection', 'id');
    if (name == null)
      throw new BuiltValueNullFieldError('BelongsToCollection', 'name');
  }

  @override
  BelongsToCollection rebuild(void updates(BelongsToCollectionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  BelongsToCollectionBuilder toBuilder() =>
      new BelongsToCollectionBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! BelongsToCollection) return false;
    return id == other.id &&
        name == other.name &&
        posterPath == other.posterPath &&
        backdropPath == other.backdropPath;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), name.hashCode), posterPath.hashCode),
        backdropPath.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BelongsToCollection')
          ..add('id', id)
          ..add('name', name)
          ..add('posterPath', posterPath)
          ..add('backdropPath', backdropPath))
        .toString();
  }
}

class BelongsToCollectionBuilder
    implements Builder<BelongsToCollection, BelongsToCollectionBuilder> {
  _$BelongsToCollection _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _posterPath;
  String get posterPath => _$this._posterPath;
  set posterPath(String posterPath) => _$this._posterPath = posterPath;

  String _backdropPath;
  String get backdropPath => _$this._backdropPath;
  set backdropPath(String backdropPath) => _$this._backdropPath = backdropPath;

  BelongsToCollectionBuilder();

  BelongsToCollectionBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _posterPath = _$v.posterPath;
      _backdropPath = _$v.backdropPath;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BelongsToCollection other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$BelongsToCollection;
  }

  @override
  void update(void updates(BelongsToCollectionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$BelongsToCollection build() {
    final _$result = _$v ??
        new _$BelongsToCollection._(
            id: id,
            name: name,
            posterPath: posterPath,
            backdropPath: backdropPath);
    replace(_$result);
    return _$result;
  }
}
