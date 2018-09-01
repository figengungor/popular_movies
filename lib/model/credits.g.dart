// GENERATED CODE - DO NOT MODIFY BY HAND

part of credits;

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

Serializer<Credits> _$creditsSerializer = new _$CreditsSerializer();

class _$CreditsSerializer implements StructuredSerializer<Credits> {
  @override
  final Iterable<Type> types = const [Credits, _$Credits];
  @override
  final String wireName = 'Credits';

  @override
  Iterable serialize(Serializers serializers, Credits object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'cast',
      serializers.serialize(object.cast,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Cast)])),
      'crew',
      serializers.serialize(object.crew,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Crew)])),
    ];

    return result;
  }

  @override
  Credits deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CreditsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'cast':
          result.cast.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Cast)]))
              as BuiltList);
          break;
        case 'crew':
          result.crew.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Crew)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$Credits extends Credits {
  @override
  final BuiltList<Cast> cast;
  @override
  final BuiltList<Crew> crew;

  factory _$Credits([void updates(CreditsBuilder b)]) =>
      (new CreditsBuilder()..update(updates)).build();

  _$Credits._({this.cast, this.crew}) : super._() {
    if (cast == null) throw new BuiltValueNullFieldError('Credits', 'cast');
    if (crew == null) throw new BuiltValueNullFieldError('Credits', 'crew');
  }

  @override
  Credits rebuild(void updates(CreditsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CreditsBuilder toBuilder() => new CreditsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Credits && cast == other.cast && crew == other.crew;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, cast.hashCode), crew.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Credits')
          ..add('cast', cast)
          ..add('crew', crew))
        .toString();
  }
}

class CreditsBuilder implements Builder<Credits, CreditsBuilder> {
  _$Credits _$v;

  ListBuilder<Cast> _cast;
  ListBuilder<Cast> get cast => _$this._cast ??= new ListBuilder<Cast>();
  set cast(ListBuilder<Cast> cast) => _$this._cast = cast;

  ListBuilder<Crew> _crew;
  ListBuilder<Crew> get crew => _$this._crew ??= new ListBuilder<Crew>();
  set crew(ListBuilder<Crew> crew) => _$this._crew = crew;

  CreditsBuilder();

  CreditsBuilder get _$this {
    if (_$v != null) {
      _cast = _$v.cast?.toBuilder();
      _crew = _$v.crew?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Credits other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Credits;
  }

  @override
  void update(void updates(CreditsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Credits build() {
    _$Credits _$result;
    try {
      _$result = _$v ?? new _$Credits._(cast: cast.build(), crew: crew.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'cast';
        cast.build();
        _$failedField = 'crew';
        crew.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Credits', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
