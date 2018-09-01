// GENERATED CODE - DO NOT MODIFY BY HAND

part of tagged_images;

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

Serializer<TaggedImages> _$taggedImagesSerializer =
    new _$TaggedImagesSerializer();

class _$TaggedImagesSerializer implements StructuredSerializer<TaggedImages> {
  @override
  final Iterable<Type> types = const [TaggedImages, _$TaggedImages];
  @override
  final String wireName = 'TaggedImages';

  @override
  Iterable serialize(Serializers serializers, TaggedImages object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'page',
      serializers.serialize(object.page, specifiedType: const FullType(int)),
      'results',
      serializers.serialize(object.results,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TaggedImage)])),
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
  TaggedImages deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaggedImagesBuilder();

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
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TaggedImage)]))
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

class _$TaggedImages extends TaggedImages {
  @override
  final int id;
  @override
  final int page;
  @override
  final BuiltList<TaggedImage> results;
  @override
  final int totalPages;
  @override
  final int totalResults;

  factory _$TaggedImages([void updates(TaggedImagesBuilder b)]) =>
      (new TaggedImagesBuilder()..update(updates)).build();

  _$TaggedImages._(
      {this.id, this.page, this.results, this.totalPages, this.totalResults})
      : super._() {
    if (id == null) throw new BuiltValueNullFieldError('TaggedImages', 'id');
    if (page == null)
      throw new BuiltValueNullFieldError('TaggedImages', 'page');
    if (results == null)
      throw new BuiltValueNullFieldError('TaggedImages', 'results');
    if (totalPages == null)
      throw new BuiltValueNullFieldError('TaggedImages', 'totalPages');
    if (totalResults == null)
      throw new BuiltValueNullFieldError('TaggedImages', 'totalResults');
  }

  @override
  TaggedImages rebuild(void updates(TaggedImagesBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TaggedImagesBuilder toBuilder() => new TaggedImagesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaggedImages &&
        id == other.id &&
        page == other.page &&
        results == other.results &&
        totalPages == other.totalPages &&
        totalResults == other.totalResults;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), page.hashCode), results.hashCode),
            totalPages.hashCode),
        totalResults.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TaggedImages')
          ..add('id', id)
          ..add('page', page)
          ..add('results', results)
          ..add('totalPages', totalPages)
          ..add('totalResults', totalResults))
        .toString();
  }
}

class TaggedImagesBuilder
    implements Builder<TaggedImages, TaggedImagesBuilder> {
  _$TaggedImages _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _page;
  int get page => _$this._page;
  set page(int page) => _$this._page = page;

  ListBuilder<TaggedImage> _results;
  ListBuilder<TaggedImage> get results =>
      _$this._results ??= new ListBuilder<TaggedImage>();
  set results(ListBuilder<TaggedImage> results) => _$this._results = results;

  int _totalPages;
  int get totalPages => _$this._totalPages;
  set totalPages(int totalPages) => _$this._totalPages = totalPages;

  int _totalResults;
  int get totalResults => _$this._totalResults;
  set totalResults(int totalResults) => _$this._totalResults = totalResults;

  TaggedImagesBuilder();

  TaggedImagesBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _page = _$v.page;
      _results = _$v.results?.toBuilder();
      _totalPages = _$v.totalPages;
      _totalResults = _$v.totalResults;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaggedImages other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$TaggedImages;
  }

  @override
  void update(void updates(TaggedImagesBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TaggedImages build() {
    _$TaggedImages _$result;
    try {
      _$result = _$v ??
          new _$TaggedImages._(
              id: id,
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
            'TaggedImages', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
