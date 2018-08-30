// GENERATED CODE - DO NOT MODIFY BY HAND

part of person_detail;

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

Serializer<PersonDetail> _$personDetailSerializer =
    new _$PersonDetailSerializer();

class _$PersonDetailSerializer implements StructuredSerializer<PersonDetail> {
  @override
  final Iterable<Type> types = const [PersonDetail, _$PersonDetail];
  @override
  final String wireName = 'PersonDetail';

  @override
  Iterable serialize(Serializers serializers, PersonDetail object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'known_for_department',
      serializers.serialize(object.knownForDepartment,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'external_ids',
      serializers.serialize(object.externalIds,
          specifiedType: const FullType(ExternalIds)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'also_known_as',
      serializers.serialize(object.alsoKnownAs,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'gender',
      serializers.serialize(object.gender, specifiedType: const FullType(int)),
      'biography',
      serializers.serialize(object.biography,
          specifiedType: const FullType(String)),
      'popularity',
      serializers.serialize(object.popularity,
          specifiedType: const FullType(double)),
      'adult',
      serializers.serialize(object.adult, specifiedType: const FullType(bool)),
      'imdb_id',
      serializers.serialize(object.imdbId,
          specifiedType: const FullType(String)),
    ];
    if (object.birthday != null) {
      result
        ..add('birthday')
        ..add(serializers.serialize(object.birthday,
            specifiedType: const FullType(String)));
    }
    if (object.deathday != null) {
      result
        ..add('deathday')
        ..add(serializers.serialize(object.deathday,
            specifiedType: const FullType(String)));
    }
    if (object.placeOfBirth != null) {
      result
        ..add('place_of_birth')
        ..add(serializers.serialize(object.placeOfBirth,
            specifiedType: const FullType(String)));
    }
    if (object.profilePath != null) {
      result
        ..add('profile_path')
        ..add(serializers.serialize(object.profilePath,
            specifiedType: const FullType(String)));
    }
    if (object.homepage != null) {
      result
        ..add('homepage')
        ..add(serializers.serialize(object.homepage,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  PersonDetail deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new PersonDetailBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'birthday':
          result.birthday = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'known_for_department':
          result.knownForDepartment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deathday':
          result.deathday = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'external_ids':
          result.externalIds.replace(serializers.deserialize(value,
              specifiedType: const FullType(ExternalIds)) as ExternalIds);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'also_known_as':
          result.alsoKnownAs.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'biography':
          result.biography = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'popularity':
          result.popularity = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'place_of_birth':
          result.placeOfBirth = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'profile_path':
          result.profilePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'adult':
          result.adult = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'imdb_id':
          result.imdbId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'homepage':
          result.homepage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PersonDetail extends PersonDetail {
  @override
  final String birthday;
  @override
  final String knownForDepartment;
  @override
  final String deathday;
  @override
  final int id;
  @override
  final ExternalIds externalIds;
  @override
  final String name;
  @override
  final BuiltList<String> alsoKnownAs;
  @override
  final int gender;
  @override
  final String biography;
  @override
  final double popularity;
  @override
  final String placeOfBirth;
  @override
  final String profilePath;
  @override
  final bool adult;
  @override
  final String imdbId;
  @override
  final String homepage;

  factory _$PersonDetail([void updates(PersonDetailBuilder b)]) =>
      (new PersonDetailBuilder()..update(updates)).build();

  _$PersonDetail._(
      {this.birthday,
      this.knownForDepartment,
      this.deathday,
      this.id,
      this.externalIds,
      this.name,
      this.alsoKnownAs,
      this.gender,
      this.biography,
      this.popularity,
      this.placeOfBirth,
      this.profilePath,
      this.adult,
      this.imdbId,
      this.homepage})
      : super._() {
    if (knownForDepartment == null)
      throw new BuiltValueNullFieldError('PersonDetail', 'knownForDepartment');
    if (id == null) throw new BuiltValueNullFieldError('PersonDetail', 'id');
    if (externalIds == null)
      throw new BuiltValueNullFieldError('PersonDetail', 'externalIds');
    if (name == null)
      throw new BuiltValueNullFieldError('PersonDetail', 'name');
    if (alsoKnownAs == null)
      throw new BuiltValueNullFieldError('PersonDetail', 'alsoKnownAs');
    if (gender == null)
      throw new BuiltValueNullFieldError('PersonDetail', 'gender');
    if (biography == null)
      throw new BuiltValueNullFieldError('PersonDetail', 'biography');
    if (popularity == null)
      throw new BuiltValueNullFieldError('PersonDetail', 'popularity');
    if (adult == null)
      throw new BuiltValueNullFieldError('PersonDetail', 'adult');
    if (imdbId == null)
      throw new BuiltValueNullFieldError('PersonDetail', 'imdbId');
  }

  @override
  PersonDetail rebuild(void updates(PersonDetailBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PersonDetailBuilder toBuilder() => new PersonDetailBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! PersonDetail) return false;
    return birthday == other.birthday &&
        knownForDepartment == other.knownForDepartment &&
        deathday == other.deathday &&
        id == other.id &&
        externalIds == other.externalIds &&
        name == other.name &&
        alsoKnownAs == other.alsoKnownAs &&
        gender == other.gender &&
        biography == other.biography &&
        popularity == other.popularity &&
        placeOfBirth == other.placeOfBirth &&
        profilePath == other.profilePath &&
        adult == other.adult &&
        imdbId == other.imdbId &&
        homepage == other.homepage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                birthday
                                                                    .hashCode),
                                                            knownForDepartment
                                                                .hashCode),
                                                        deathday.hashCode),
                                                    id.hashCode),
                                                externalIds.hashCode),
                                            name.hashCode),
                                        alsoKnownAs.hashCode),
                                    gender.hashCode),
                                biography.hashCode),
                            popularity.hashCode),
                        placeOfBirth.hashCode),
                    profilePath.hashCode),
                adult.hashCode),
            imdbId.hashCode),
        homepage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PersonDetail')
          ..add('birthday', birthday)
          ..add('knownForDepartment', knownForDepartment)
          ..add('deathday', deathday)
          ..add('id', id)
          ..add('externalIds', externalIds)
          ..add('name', name)
          ..add('alsoKnownAs', alsoKnownAs)
          ..add('gender', gender)
          ..add('biography', biography)
          ..add('popularity', popularity)
          ..add('placeOfBirth', placeOfBirth)
          ..add('profilePath', profilePath)
          ..add('adult', adult)
          ..add('imdbId', imdbId)
          ..add('homepage', homepage))
        .toString();
  }
}

class PersonDetailBuilder
    implements Builder<PersonDetail, PersonDetailBuilder> {
  _$PersonDetail _$v;

  String _birthday;
  String get birthday => _$this._birthday;
  set birthday(String birthday) => _$this._birthday = birthday;

  String _knownForDepartment;
  String get knownForDepartment => _$this._knownForDepartment;
  set knownForDepartment(String knownForDepartment) =>
      _$this._knownForDepartment = knownForDepartment;

  String _deathday;
  String get deathday => _$this._deathday;
  set deathday(String deathday) => _$this._deathday = deathday;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  ExternalIdsBuilder _externalIds;
  ExternalIdsBuilder get externalIds =>
      _$this._externalIds ??= new ExternalIdsBuilder();
  set externalIds(ExternalIdsBuilder externalIds) =>
      _$this._externalIds = externalIds;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ListBuilder<String> _alsoKnownAs;
  ListBuilder<String> get alsoKnownAs =>
      _$this._alsoKnownAs ??= new ListBuilder<String>();
  set alsoKnownAs(ListBuilder<String> alsoKnownAs) =>
      _$this._alsoKnownAs = alsoKnownAs;

  int _gender;
  int get gender => _$this._gender;
  set gender(int gender) => _$this._gender = gender;

  String _biography;
  String get biography => _$this._biography;
  set biography(String biography) => _$this._biography = biography;

  double _popularity;
  double get popularity => _$this._popularity;
  set popularity(double popularity) => _$this._popularity = popularity;

  String _placeOfBirth;
  String get placeOfBirth => _$this._placeOfBirth;
  set placeOfBirth(String placeOfBirth) => _$this._placeOfBirth = placeOfBirth;

  String _profilePath;
  String get profilePath => _$this._profilePath;
  set profilePath(String profilePath) => _$this._profilePath = profilePath;

  bool _adult;
  bool get adult => _$this._adult;
  set adult(bool adult) => _$this._adult = adult;

  String _imdbId;
  String get imdbId => _$this._imdbId;
  set imdbId(String imdbId) => _$this._imdbId = imdbId;

  String _homepage;
  String get homepage => _$this._homepage;
  set homepage(String homepage) => _$this._homepage = homepage;

  PersonDetailBuilder();

  PersonDetailBuilder get _$this {
    if (_$v != null) {
      _birthday = _$v.birthday;
      _knownForDepartment = _$v.knownForDepartment;
      _deathday = _$v.deathday;
      _id = _$v.id;
      _externalIds = _$v.externalIds?.toBuilder();
      _name = _$v.name;
      _alsoKnownAs = _$v.alsoKnownAs?.toBuilder();
      _gender = _$v.gender;
      _biography = _$v.biography;
      _popularity = _$v.popularity;
      _placeOfBirth = _$v.placeOfBirth;
      _profilePath = _$v.profilePath;
      _adult = _$v.adult;
      _imdbId = _$v.imdbId;
      _homepage = _$v.homepage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PersonDetail other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$PersonDetail;
  }

  @override
  void update(void updates(PersonDetailBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$PersonDetail build() {
    _$PersonDetail _$result;
    try {
      _$result = _$v ??
          new _$PersonDetail._(
              birthday: birthday,
              knownForDepartment: knownForDepartment,
              deathday: deathday,
              id: id,
              externalIds: externalIds.build(),
              name: name,
              alsoKnownAs: alsoKnownAs.build(),
              gender: gender,
              biography: biography,
              popularity: popularity,
              placeOfBirth: placeOfBirth,
              profilePath: profilePath,
              adult: adult,
              imdbId: imdbId,
              homepage: homepage);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'externalIds';
        externalIds.build();

        _$failedField = 'alsoKnownAs';
        alsoKnownAs.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PersonDetail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
