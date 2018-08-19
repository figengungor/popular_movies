// GENERATED CODE - DO NOT MODIFY BY HAND

part of reviews;

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

Serializer<Reviews> _$reviewsSerializer = new _$ReviewsSerializer();

class _$ReviewsSerializer implements StructuredSerializer<Reviews> {
  @override
  final Iterable<Type> types = const [Reviews, _$Reviews];
  @override
  final String wireName = 'Reviews';

  @override
  Iterable serialize(Serializers serializers, Reviews object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(int)),
      'results',
      serializers.serialize(object.results,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Review)])),
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
  Reviews deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ReviewsBuilder();

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
                      const FullType(BuiltList, const [const FullType(Review)]))
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

class _$Reviews extends Reviews {
  @override
  final int page;
  @override
  final BuiltList<Review> results;
  @override
  final int totalPages;
  @override
  final int totalResults;

  factory _$Reviews([void updates(ReviewsBuilder b)]) =>
      (new ReviewsBuilder()..update(updates)).build();

  _$Reviews._({this.page, this.results, this.totalPages, this.totalResults})
      : super._() {
    if (page == null) throw new BuiltValueNullFieldError('Reviews', 'page');
    if (results == null)
      throw new BuiltValueNullFieldError('Reviews', 'results');
    if (totalPages == null)
      throw new BuiltValueNullFieldError('Reviews', 'totalPages');
    if (totalResults == null)
      throw new BuiltValueNullFieldError('Reviews', 'totalResults');
  }

  @override
  Reviews rebuild(void updates(ReviewsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewsBuilder toBuilder() => new ReviewsBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Reviews) return false;
    return page == other.page &&
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
    return (newBuiltValueToStringHelper('Reviews')
          ..add('page', page)
          ..add('results', results)
          ..add('totalPages', totalPages)
          ..add('totalResults', totalResults))
        .toString();
  }
}

class ReviewsBuilder implements Builder<Reviews, ReviewsBuilder> {
  _$Reviews _$v;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  ListBuilder<Review> _results;
  ListBuilder<Review> get results =>
      _$this._results ??= new ListBuilder<Review>();
  set results(ListBuilder<Review> results) => _$this._results = results;

  int _totalPages;
  int get totalPages => _$this._totalPages;
  set totalPages(int totalPages) => _$this._totalPages = totalPages;

  int _totalResults;
  int get totalResults => _$this._totalResults;
  set totalResults(int totalResults) => _$this._totalResults = totalResults;

  ReviewsBuilder();

  ReviewsBuilder get _$this {
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
  void replace(Reviews other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Reviews;
  }

  @override
  void update(void updates(ReviewsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Reviews build() {
    _$Reviews _$result;
    try {
      _$result = _$v ??
          new _$Reviews._(
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
            'Reviews', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
