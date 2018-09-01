// GENERATED CODE - DO NOT MODIFY BY HAND

part of similar;

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

Serializer<Similar> _$similarSerializer = new _$SimilarSerializer();

class _$SimilarSerializer implements StructuredSerializer<Similar> {
  @override
  final Iterable<Type> types = const [Similar, _$Similar];
  @override
  final String wireName = 'Similar';

  @override
  Iterable serialize(Serializers serializers, Similar object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(int)),
      'results',
      serializers.serialize(object.results,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Movie)])),
      'total_pages',
      serializers.serialize(object.totalPages,
          specifiedType: const FullType(int)),
      'total_results',
      serializers.serialize(object.totalResults,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Similar deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SimilarBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Movie)]))
              as BuiltList);
          break;
        case 'total_pages':
          result.totalPages = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'total_results':
          result.totalResults = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Similar extends Similar {
  @override
  final int page;
  @override
  final BuiltList<Movie> results;
  @override
  final int totalPages;
  @override
  final int totalResults;

  factory _$Similar([void updates(SimilarBuilder b)]) =>
      (new SimilarBuilder()..update(updates)).build();

  _$Similar._({this.page, this.results, this.totalPages, this.totalResults})
      : super._() {
    if (page == null) throw new BuiltValueNullFieldError('Similar', 'page');
    if (results == null)
      throw new BuiltValueNullFieldError('Similar', 'results');
    if (totalPages == null)
      throw new BuiltValueNullFieldError('Similar', 'totalPages');
    if (totalResults == null)
      throw new BuiltValueNullFieldError('Similar', 'totalResults');
  }

  @override
  Similar rebuild(void updates(SimilarBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SimilarBuilder toBuilder() => new SimilarBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Similar &&
        page == other.page &&
        results == other.results &&
        totalPages == other.totalPages &&
        totalResults == other.totalResults;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, page.hashCode), results.hashCode), totalPages.hashCode),
        totalResults.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Similar')
          ..add('page', page)
          ..add('results', results)
          ..add('totalPages', totalPages)
          ..add('totalResults', totalResults))
        .toString();
  }
}

class SimilarBuilder implements Builder<Similar, SimilarBuilder> {
  _$Similar _$v;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  ListBuilder<Movie> _results;
  ListBuilder<Movie> get results =>
      _$this._results ??= new ListBuilder<Movie>();
  set results(ListBuilder<Movie> results) => _$this._results = results;

  int _totalPages;
  int get totalPages => _$this._totalPages;
  set totalPages(int totalPages) => _$this._totalPages = totalPages;

  int _totalResults;
  int get totalResults => _$this._totalResults;
  set totalResults(int totalResults) => _$this._totalResults = totalResults;

  SimilarBuilder();

  SimilarBuilder get _$this {
    if (_$v != null) {
      _page = _$v.page;
      _results = _$v.results?.toBuilder();
      _totalPages = _$v.totalPages;
      _totalResults = _$v.totalResults;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Similar other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Similar;
  }

  @override
  void update(void updates(SimilarBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Similar build() {
    _$Similar _$result;
    try {
      _$result = _$v ??
          new _$Similar._(
              page: page,
              results: results.build(),
              totalPages: totalPages,
              totalResults: totalResults);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Similar', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
