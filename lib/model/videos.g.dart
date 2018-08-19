// GENERATED CODE - DO NOT MODIFY BY HAND

part of videos;

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

Serializer<Videos> _$videosSerializer = new _$VideosSerializer();

class _$VideosSerializer implements StructuredSerializer<Videos> {
  @override
  final Iterable<Type> types = const [Videos, _$Videos];
  @override
  final String wireName = 'Videos';

  @override
  Iterable serialize(Serializers serializers, Videos object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'results',
      serializers.serialize(object.results,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Video)])),
    ];

    return result;
  }

  @override
  Videos deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new VideosBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Video)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$Videos extends Videos {
  @override
  final BuiltList<Video> results;

  factory _$Videos([void updates(VideosBuilder b)]) =>
      (new VideosBuilder()..update(updates)).build();

  _$Videos._({this.results}) : super._() {
    if (results == null)
      throw new BuiltValueNullFieldError('Videos', 'results');
  }

  @override
  Videos rebuild(void updates(VideosBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  VideosBuilder toBuilder() => new VideosBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Videos) return false;
    return results == other.results;
  }

  @override
  int get hashCode {
    return $jf($jc(0, results.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Videos')..add('results', results))
        .toString();
  }
}

class VideosBuilder implements Builder<Videos, VideosBuilder> {
  _$Videos _$v;

  ListBuilder<Video> _results;
  ListBuilder<Video> get results =>
      _$this._results ??= new ListBuilder<Video>();
  set results(ListBuilder<Video> results) => _$this._results = results;

  VideosBuilder();

  VideosBuilder get _$this {
    if (_$v != null) {
      _results = _$v.results?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Videos other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Videos;
  }

  @override
  void update(void updates(VideosBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Videos build() {
    _$Videos _$result;
    try {
      _$result = _$v ?? new _$Videos._(results: results.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Videos', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
