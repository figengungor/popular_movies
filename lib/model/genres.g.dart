// GENERATED CODE - DO NOT MODIFY BY HAND

part of genres;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new

Serializer<Genres> _$genresSerializer = new _$GenresSerializer();

class _$GenresSerializer implements StructuredSerializer<Genres> {
  @override
  final Iterable<Type> types = const [Genres, _$Genres];
  @override
  final String wireName = 'Genres';

  @override
  Iterable serialize(Serializers serializers, Genres object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Genres deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GenresBuilder();

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
      }
    }

    return result.build();
  }
}

class _$Genres extends Genres {
  @override
  final int id;
  @override
  final String name;

  factory _$Genres([void updates(GenresBuilder b)]) =>
      (new GenresBuilder()..update(updates)).build();

  _$Genres._({this.id, this.name}) : super._() {
    if (id == null) throw new BuiltValueNullFieldError('Genres', 'id');
    if (name == null) throw new BuiltValueNullFieldError('Genres', 'name');
  }

  @override
  Genres rebuild(void updates(GenresBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GenresBuilder toBuilder() => new GenresBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Genres && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Genres')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GenresBuilder implements Builder<Genres, GenresBuilder> {
  _$Genres _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  GenresBuilder();

  GenresBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Genres other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Genres;
  }

  @override
  void update(void updates(GenresBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Genres build() {
    final _$result = _$v ?? new _$Genres._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}
