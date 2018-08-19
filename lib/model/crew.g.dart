// GENERATED CODE - DO NOT MODIFY BY HAND

part of crew;

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

Serializer<Crew> _$crewSerializer = new _$CrewSerializer();

class _$CrewSerializer implements StructuredSerializer<Crew> {
  @override
  final Iterable<Type> types = const [Crew, _$Crew];
  @override
  final String wireName = 'Crew';

  @override
  Iterable serialize(Serializers serializers, Crew object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'credit_id',
      serializers.serialize(object.creditId,
          specifiedType: const FullType(String)),
      'department',
      serializers.serialize(object.department,
          specifiedType: const FullType(String)),
      'gender',
      serializers.serialize(object.gender, specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'job',
      serializers.serialize(object.job, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
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
  Crew deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new CrewBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'credit_id':
          result.creditId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'department':
          result.department = serializers.deserialize(value,
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
        case 'job':
          result.job = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$Crew extends Crew {
  @override
  final String creditId;
  @override
  final String department;
  @override
  final int gender;
  @override
  final int id;
  @override
  final String job;
  @override
  final String name;
  @override
  final String profilePath;

  factory _$Crew([void updates(CrewBuilder b)]) =>
      (new CrewBuilder()..update(updates)).build();

  _$Crew._(
      {this.creditId,
      this.department,
      this.gender,
      this.id,
      this.job,
      this.name,
      this.profilePath})
      : super._() {
    if (creditId == null)
      throw new BuiltValueNullFieldError('Crew', 'creditId');
    if (department == null)
      throw new BuiltValueNullFieldError('Crew', 'department');
    if (gender == null) throw new BuiltValueNullFieldError('Crew', 'gender');
    if (id == null) throw new BuiltValueNullFieldError('Crew', 'id');
    if (job == null) throw new BuiltValueNullFieldError('Crew', 'job');
    if (name == null) throw new BuiltValueNullFieldError('Crew', 'name');
  }

  @override
  Crew rebuild(void updates(CrewBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CrewBuilder toBuilder() => new CrewBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Crew) return false;
    return creditId == other.creditId &&
        department == other.department &&
        gender == other.gender &&
        id == other.id &&
        job == other.job &&
        name == other.name &&
        profilePath == other.profilePath;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, creditId.hashCode), department.hashCode),
                        gender.hashCode),
                    id.hashCode),
                job.hashCode),
            name.hashCode),
        profilePath.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Crew')
          ..add('creditId', creditId)
          ..add('department', department)
          ..add('gender', gender)
          ..add('id', id)
          ..add('job', job)
          ..add('name', name)
          ..add('profilePath', profilePath))
        .toString();
  }
}

class CrewBuilder implements Builder<Crew, CrewBuilder> {
  _$Crew _$v;

  String _creditId;
  String get creditId => _$this._creditId;
  set creditId(String creditId) => _$this._creditId = creditId;

  String _department;
  String get department => _$this._department;
  set department(String department) => _$this._department = department;

  int _gender;
  int get gender => _$this._gender;
  set gender(int gender) => _$this._gender = gender;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _job;
  String get job => _$this._job;
  set job(String job) => _$this._job = job;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _profilePath;
  String get profilePath => _$this._profilePath;
  set profilePath(String profilePath) => _$this._profilePath = profilePath;

  CrewBuilder();

  CrewBuilder get _$this {
    if (_$v != null) {
      _creditId = _$v.creditId;
      _department = _$v.department;
      _gender = _$v.gender;
      _id = _$v.id;
      _job = _$v.job;
      _name = _$v.name;
      _profilePath = _$v.profilePath;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Crew other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Crew;
  }

  @override
  void update(void updates(CrewBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Crew build() {
    final _$result = _$v ??
        new _$Crew._(
            creditId: creditId,
            department: department,
            gender: gender,
            id: id,
            job: job,
            name: name,
            profilePath: profilePath);
    replace(_$result);
    return _$result;
  }
}
