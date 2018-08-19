// GENERATED CODE - DO NOT MODIFY BY HAND

part of spoken_languages;

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

Serializer<SpokenLanguages> _$spokenLanguagesSerializer =
    new _$SpokenLanguagesSerializer();

class _$SpokenLanguagesSerializer
    implements StructuredSerializer<SpokenLanguages> {
  @override
  final Iterable<Type> types = const [SpokenLanguages, _$SpokenLanguages];
  @override
  final String wireName = 'SpokenLanguages';

  @override
  Iterable serialize(Serializers serializers, SpokenLanguages object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'iso_639_1',
      serializers.serialize(object.iso6391,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SpokenLanguages deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new SpokenLanguagesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'iso_639_1':
          result.iso6391 = serializers.deserialize(value,
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

class _$SpokenLanguages extends SpokenLanguages {
  @override
  final String iso6391;
  @override
  final String name;

  factory _$SpokenLanguages([void updates(SpokenLanguagesBuilder b)]) =>
      (new SpokenLanguagesBuilder()..update(updates)).build();

  _$SpokenLanguages._({this.iso6391, this.name}) : super._() {
    if (iso6391 == null)
      throw new BuiltValueNullFieldError('SpokenLanguages', 'iso6391');
    if (name == null)
      throw new BuiltValueNullFieldError('SpokenLanguages', 'name');
  }

  @override
  SpokenLanguages rebuild(void updates(SpokenLanguagesBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SpokenLanguagesBuilder toBuilder() =>
      new SpokenLanguagesBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SpokenLanguages) return false;
    return iso6391 == other.iso6391 && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, iso6391.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SpokenLanguages')
          ..add('iso6391', iso6391)
          ..add('name', name))
        .toString();
  }
}

class SpokenLanguagesBuilder
    implements Builder<SpokenLanguages, SpokenLanguagesBuilder> {
  _$SpokenLanguages _$v;

  String _iso6391;
  String get iso6391 => _$this._iso6391;
  set iso6391(String iso6391) => _$this._iso6391 = iso6391;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  SpokenLanguagesBuilder();

  SpokenLanguagesBuilder get _$this {
    if (_$v != null) {
      _iso6391 = _$v.iso6391;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SpokenLanguages other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$SpokenLanguages;
  }

  @override
  void update(void updates(SpokenLanguagesBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SpokenLanguages build() {
    final _$result =
        _$v ?? new _$SpokenLanguages._(iso6391: iso6391, name: name);
    replace(_$result);
    return _$result;
  }
}
