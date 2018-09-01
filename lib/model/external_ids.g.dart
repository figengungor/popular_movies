// GENERATED CODE - DO NOT MODIFY BY HAND

part of external_ids;

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

Serializer<ExternalIds> _$externalIdsSerializer = new _$ExternalIdsSerializer();

class _$ExternalIdsSerializer implements StructuredSerializer<ExternalIds> {
  @override
  final Iterable<Type> types = const [ExternalIds, _$ExternalIds];
  @override
  final String wireName = 'ExternalIds';

  @override
  Iterable serialize(Serializers serializers, ExternalIds object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.freebaseId != null) {
      result
        ..add('freebase_id')
        ..add(serializers.serialize(object.freebaseId,
            specifiedType: const FullType(String)));
    }
    if (object.instagramId != null) {
      result
        ..add('instagram_id')
        ..add(serializers.serialize(object.instagramId,
            specifiedType: const FullType(String)));
    }
    if (object.tvrageId != null) {
      result
        ..add('tvrage_id')
        ..add(serializers.serialize(object.tvrageId,
            specifiedType: const FullType(int)));
    }
    if (object.twitterId != null) {
      result
        ..add('twitter_id')
        ..add(serializers.serialize(object.twitterId,
            specifiedType: const FullType(String)));
    }
    if (object.freebaseMid != null) {
      result
        ..add('freebase_mid')
        ..add(serializers.serialize(object.freebaseMid,
            specifiedType: const FullType(String)));
    }
    if (object.imdbId != null) {
      result
        ..add('imdb_id')
        ..add(serializers.serialize(object.imdbId,
            specifiedType: const FullType(String)));
    }
    if (object.facebookId != null) {
      result
        ..add('facebook_id')
        ..add(serializers.serialize(object.facebookId,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  ExternalIds deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExternalIdsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'freebase_id':
          result.freebaseId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'instagram_id':
          result.instagramId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tvrage_id':
          result.tvrageId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'twitter_id':
          result.twitterId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'freebase_mid':
          result.freebaseMid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imdb_id':
          result.imdbId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'facebook_id':
          result.facebookId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ExternalIds extends ExternalIds {
  @override
  final String freebaseId;
  @override
  final String instagramId;
  @override
  final int tvrageId;
  @override
  final String twitterId;
  @override
  final String freebaseMid;
  @override
  final String imdbId;
  @override
  final String facebookId;

  factory _$ExternalIds([void updates(ExternalIdsBuilder b)]) =>
      (new ExternalIdsBuilder()..update(updates)).build();

  _$ExternalIds._(
      {this.freebaseId,
      this.instagramId,
      this.tvrageId,
      this.twitterId,
      this.freebaseMid,
      this.imdbId,
      this.facebookId})
      : super._();

  @override
  ExternalIds rebuild(void updates(ExternalIdsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ExternalIdsBuilder toBuilder() => new ExternalIdsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExternalIds &&
        freebaseId == other.freebaseId &&
        instagramId == other.instagramId &&
        tvrageId == other.tvrageId &&
        twitterId == other.twitterId &&
        freebaseMid == other.freebaseMid &&
        imdbId == other.imdbId &&
        facebookId == other.facebookId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, freebaseId.hashCode), instagramId.hashCode),
                        tvrageId.hashCode),
                    twitterId.hashCode),
                freebaseMid.hashCode),
            imdbId.hashCode),
        facebookId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ExternalIds')
          ..add('freebaseId', freebaseId)
          ..add('instagramId', instagramId)
          ..add('tvrageId', tvrageId)
          ..add('twitterId', twitterId)
          ..add('freebaseMid', freebaseMid)
          ..add('imdbId', imdbId)
          ..add('facebookId', facebookId))
        .toString();
  }
}

class ExternalIdsBuilder implements Builder<ExternalIds, ExternalIdsBuilder> {
  _$ExternalIds _$v;

  String _freebaseId;
  String get freebaseId => _$this._freebaseId;
  set freebaseId(String freebaseId) => _$this._freebaseId = freebaseId;

  String _instagramId;
  String get instagramId => _$this._instagramId;
  set instagramId(String instagramId) => _$this._instagramId = instagramId;

  int _tvrageId;
  int get tvrageId => _$this._tvrageId;
  set tvrageId(int tvrageId) => _$this._tvrageId = tvrageId;

  String _twitterId;
  String get twitterId => _$this._twitterId;
  set twitterId(String twitterId) => _$this._twitterId = twitterId;

  String _freebaseMid;
  String get freebaseMid => _$this._freebaseMid;
  set freebaseMid(String freebaseMid) => _$this._freebaseMid = freebaseMid;

  String _imdbId;
  String get imdbId => _$this._imdbId;
  set imdbId(String imdbId) => _$this._imdbId = imdbId;

  String _facebookId;
  String get facebookId => _$this._facebookId;
  set facebookId(String facebookId) => _$this._facebookId = facebookId;

  ExternalIdsBuilder();

  ExternalIdsBuilder get _$this {
    if (_$v != null) {
      _freebaseId = _$v.freebaseId;
      _instagramId = _$v.instagramId;
      _tvrageId = _$v.tvrageId;
      _twitterId = _$v.twitterId;
      _freebaseMid = _$v.freebaseMid;
      _imdbId = _$v.imdbId;
      _facebookId = _$v.facebookId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExternalIds other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$ExternalIds;
  }

  @override
  void update(void updates(ExternalIdsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ExternalIds build() {
    final _$result = _$v ??
        new _$ExternalIds._(
            freebaseId: freebaseId,
            instagramId: instagramId,
            tvrageId: tvrageId,
            twitterId: twitterId,
            freebaseMid: freebaseMid,
            imdbId: imdbId,
            facebookId: facebookId);
    replace(_$result);
    return _$result;
  }
}
