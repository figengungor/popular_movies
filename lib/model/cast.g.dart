// GENERATED CODE - DO NOT MODIFY BY HAND

part of cast;

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

Serializer<Cast> _$castSerializer = new _$CastSerializer();

class _$CastSerializer implements StructuredSerializer<Cast> {
  @override
  final Iterable<Type> types = const [Cast, _$Cast];
  @override
  final String wireName = 'Cast';

  @override
  Iterable serialize(Serializers serializers, Cast object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'cast_id',
      serializers.serialize(object.castId, specifiedType: const FullType(int)),
      'character',
      serializers.serialize(object.character,
          specifiedType: const FullType(String)),
      'credit_id',
      serializers.serialize(object.creditId,
          specifiedType: const FullType(String)),
      'gender',
      serializers.serialize(object.gender, specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'order',
      serializers.serialize(object.order, specifiedType: const FullType(int)),
    ];
    if (object.profilePath != null) {
      result
        ..add('profile_path')
        ..add(serializers.serialize(object.profilePath,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Cast deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CastBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'cast_id':
          result.castId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'character':
          result.character = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'credit_id':
          result.creditId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'order':
          result.order = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'profile_path':
          result.profilePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Cast extends Cast {
  @override
  final int castId;
  @override
  final String character;
  @override
  final String creditId;
  @override
  final int gender;
  @override
  final int id;
  @override
  final String name;
  @override
  final int order;
  @override
  final String profilePath;

  factory _$Cast([void updates(CastBuilder b)]) =>
      (new CastBuilder()..update(updates)).build();

  _$Cast._(
      {this.castId,
      this.character,
      this.creditId,
      this.gender,
      this.id,
      this.name,
      this.order,
      this.profilePath})
      : super._() {
    if (castId == null) throw new BuiltValueNullFieldError('Cast', 'castId');
    if (character == null)
      throw new BuiltValueNullFieldError('Cast', 'character');
    if (creditId == null)
      throw new BuiltValueNullFieldError('Cast', 'creditId');
    if (gender == null) throw new BuiltValueNullFieldError('Cast', 'gender');
    if (id == null) throw new BuiltValueNullFieldError('Cast', 'id');
    if (name == null) throw new BuiltValueNullFieldError('Cast', 'name');
    if (order == null) throw new BuiltValueNullFieldError('Cast', 'order');
  }

  @override
  Cast rebuild(void updates(CastBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CastBuilder toBuilder() => new CastBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cast &&
        castId == other.castId &&
        character == other.character &&
        creditId == other.creditId &&
        gender == other.gender &&
        id == other.id &&
        name == other.name &&
        order == other.order &&
        profilePath == other.profilePath;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, castId.hashCode), character.hashCode),
                            creditId.hashCode),
                        gender.hashCode),
                    id.hashCode),
                name.hashCode),
            order.hashCode),
        profilePath.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Cast')
          ..add('castId', castId)
          ..add('character', character)
          ..add('creditId', creditId)
          ..add('gender', gender)
          ..add('id', id)
          ..add('name', name)
          ..add('order', order)
          ..add('profilePath', profilePath))
        .toString();
  }
}

class CastBuilder implements Builder<Cast, CastBuilder> {
  _$Cast _$v;

  int _castId;
  int get castId => _$this._castId;
  set castId(int castId) => _$this._castId = castId;

  String _character;
  String get character => _$this._character;
  set character(String character) => _$this._character = character;

  String _creditId;
  String get creditId => _$this._creditId;
  set creditId(String creditId) => _$this._creditId = creditId;

  int _gender;
  int get gender => _$this._gender;
  set gender(int gender) => _$this._gender = gender;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _order;
  int get order => _$this._order;
  set order(int order) => _$this._order = order;

  String _profilePath;
  String get profilePath => _$this._profilePath;
  set profilePath(String profilePath) => _$this._profilePath = profilePath;

  CastBuilder();

  CastBuilder get _$this {
    if (_$v != null) {
      _castId = _$v.castId;
      _character = _$v.character;
      _creditId = _$v.creditId;
      _gender = _$v.gender;
      _id = _$v.id;
      _name = _$v.name;
      _order = _$v.order;
      _profilePath = _$v.profilePath;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Cast other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Cast;
  }

  @override
  void update(void updates(CastBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Cast build() {
    final _$result = _$v ??
        new _$Cast._(
            castId: castId,
            character: character,
            creditId: creditId,
            gender: gender,
            id: id,
            name: name,
            order: order,
            profilePath: profilePath);
    replace(_$result);
    return _$result;
  }
}
