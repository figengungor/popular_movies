// GENERATED CODE - DO NOT MODIFY BY HAND

part of review;

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

Serializer<Review> _$reviewSerializer = new _$ReviewSerializer();

class _$ReviewSerializer implements StructuredSerializer<Review> {
  @override
  final Iterable<Type> types = const [Review, _$Review];
  @override
  final String wireName = 'Review';

  @override
  Iterable serialize(Serializers serializers, Review object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(String)),
      'content',
      serializers.serialize(object.content,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Review deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ReviewBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Review extends Review {
  @override
  final String author;
  @override
  final String content;
  @override
  final String id;
  @override
  final String url;

  factory _$Review([void updates(ReviewBuilder b)]) =>
      (new ReviewBuilder()..update(updates)).build();

  _$Review._({this.author, this.content, this.id, this.url}) : super._() {
    if (author == null) throw new BuiltValueNullFieldError('Review', 'author');
    if (content == null)
      throw new BuiltValueNullFieldError('Review', 'content');
    if (id == null) throw new BuiltValueNullFieldError('Review', 'id');
    if (url == null) throw new BuiltValueNullFieldError('Review', 'url');
  }

  @override
  Review rebuild(void updates(ReviewBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewBuilder toBuilder() => new ReviewBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Review) return false;
    return author == other.author &&
        content == other.content &&
        id == other.id &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, author.hashCode), content.hashCode), id.hashCode),
        url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Review')
          ..add('author', author)
          ..add('content', content)
          ..add('id', id)
          ..add('url', url))
        .toString();
  }
}

class ReviewBuilder implements Builder<Review, ReviewBuilder> {
  _$Review _$v;

  String _author;
  String get author => _$this._author;
  set author(String author) => _$this._author = author;

  String _content;
  String get content => _$this._content;
  set content(String content) => _$this._content = content;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  ReviewBuilder();

  ReviewBuilder get _$this {
    if (_$v != null) {
      _author = _$v.author;
      _content = _$v.content;
      _id = _$v.id;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Review other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Review;
  }

  @override
  void update(void updates(ReviewBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Review build() {
    final _$result = _$v ??
        new _$Review._(author: author, content: content, id: id, url: url);
    replace(_$result);
    return _$result;
  }
}
