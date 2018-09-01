// GENERATED CODE - DO NOT MODIFY BY HAND

part of tagged_image;

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

Serializer<TaggedImage> _$taggedImageSerializer = new _$TaggedImageSerializer();

class _$TaggedImageSerializer implements StructuredSerializer<TaggedImage> {
  @override
  final Iterable<Type> types = const [TaggedImage, _$TaggedImage];
  @override
  final String wireName = 'TaggedImage';

  @override
  Iterable serialize(Serializers serializers, TaggedImage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'aspect_ratio',
      serializers.serialize(object.aspectRatio,
          specifiedType: const FullType(double)),
      'file_path',
      serializers.serialize(object.filePath,
          specifiedType: const FullType(String)),
      'height',
      serializers.serialize(object.height, specifiedType: const FullType(int)),
      'vote_average',
      serializers.serialize(object.voteAverage,
          specifiedType: const FullType(double)),
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(int)),
      'width',
      serializers.serialize(object.width, specifiedType: const FullType(int)),
      'media',
      serializers.serialize(object.media,
          specifiedType: const FullType(JsonObject)),
      'media_type',
      serializers.serialize(object.mediaType,
          specifiedType: const FullType(String)),
    ];
    if (object.iso6391 != null) {
      result
        ..add('iso_639_1')
        ..add(serializers.serialize(object.iso6391,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  TaggedImage deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaggedImageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'aspect_ratio':
          result.aspectRatio = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'file_path':
          result.filePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'iso_639_1':
          result.iso6391 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'vote_average':
          result.voteAverage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'width':
          result.width = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'media':
          result.media = serializers.deserialize(value,
              specifiedType: const FullType(JsonObject)) as JsonObject;
          break;
        case 'media_type':
          result.mediaType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TaggedImage extends TaggedImage {
  @override
  final double aspectRatio;
  @override
  final String filePath;
  @override
  final int height;
  @override
  final String iso6391;
  @override
  final double voteAverage;
  @override
  final int voteCount;
  @override
  final int width;
  @override
  final JsonObject media;
  @override
  final String mediaType;

  factory _$TaggedImage([void updates(TaggedImageBuilder b)]) =>
      (new TaggedImageBuilder()..update(updates)).build();

  _$TaggedImage._(
      {this.aspectRatio,
      this.filePath,
      this.height,
      this.iso6391,
      this.voteAverage,
      this.voteCount,
      this.width,
      this.media,
      this.mediaType})
      : super._() {
    if (aspectRatio == null)
      throw new BuiltValueNullFieldError('TaggedImage', 'aspectRatio');
    if (filePath == null)
      throw new BuiltValueNullFieldError('TaggedImage', 'filePath');
    if (height == null)
      throw new BuiltValueNullFieldError('TaggedImage', 'height');
    if (voteAverage == null)
      throw new BuiltValueNullFieldError('TaggedImage', 'voteAverage');
    if (voteCount == null)
      throw new BuiltValueNullFieldError('TaggedImage', 'voteCount');
    if (width == null)
      throw new BuiltValueNullFieldError('TaggedImage', 'width');
    if (media == null)
      throw new BuiltValueNullFieldError('TaggedImage', 'media');
    if (mediaType == null)
      throw new BuiltValueNullFieldError('TaggedImage', 'mediaType');
  }

  @override
  TaggedImage rebuild(void updates(TaggedImageBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TaggedImageBuilder toBuilder() => new TaggedImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaggedImage &&
        aspectRatio == other.aspectRatio &&
        filePath == other.filePath &&
        height == other.height &&
        iso6391 == other.iso6391 &&
        voteAverage == other.voteAverage &&
        voteCount == other.voteCount &&
        width == other.width &&
        media == other.media &&
        mediaType == other.mediaType;
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
                                $jc($jc(0, aspectRatio.hashCode),
                                    filePath.hashCode),
                                height.hashCode),
                            iso6391.hashCode),
                        voteAverage.hashCode),
                    voteCount.hashCode),
                width.hashCode),
            media.hashCode),
        mediaType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TaggedImage')
          ..add('aspectRatio', aspectRatio)
          ..add('filePath', filePath)
          ..add('height', height)
          ..add('iso6391', iso6391)
          ..add('voteAverage', voteAverage)
          ..add('voteCount', voteCount)
          ..add('width', width)
          ..add('media', media)
          ..add('mediaType', mediaType))
        .toString();
  }
}

class TaggedImageBuilder implements Builder<TaggedImage, TaggedImageBuilder> {
  _$TaggedImage _$v;

  double _aspectRatio;
  double get aspectRatio => _$this._aspectRatio;
  set aspectRatio(double aspectRatio) => _$this._aspectRatio = aspectRatio;

  String _filePath;
  String get filePath => _$this._filePath;
  set filePath(String filePath) => _$this._filePath = filePath;

  int _height;
  int get height => _$this._height;
  set height(int height) => _$this._height = height;

  String _iso6391;
  String get iso6391 => _$this._iso6391;
  set iso6391(String iso6391) => _$this._iso6391 = iso6391;

  double _voteAverage;
  double get voteAverage => _$this._voteAverage;
  set voteAverage(double voteAverage) => _$this._voteAverage = voteAverage;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  int _width;
  int get width => _$this._width;
  set width(int width) => _$this._width = width;

  JsonObject _media;
  JsonObject get media => _$this._media;
  set media(JsonObject media) => _$this._media = media;

  String _mediaType;
  String get mediaType => _$this._mediaType;
  set mediaType(String mediaType) => _$this._mediaType = mediaType;

  TaggedImageBuilder();

  TaggedImageBuilder get _$this {
    if (_$v != null) {
      _aspectRatio = _$v.aspectRatio;
      _filePath = _$v.filePath;
      _height = _$v.height;
      _iso6391 = _$v.iso6391;
      _voteAverage = _$v.voteAverage;
      _voteCount = _$v.voteCount;
      _width = _$v.width;
      _media = _$v.media;
      _mediaType = _$v.mediaType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaggedImage other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$TaggedImage;
  }

  @override
  void update(void updates(TaggedImageBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TaggedImage build() {
    final _$result = _$v ??
        new _$TaggedImage._(
            aspectRatio: aspectRatio,
            filePath: filePath,
            height: height,
            iso6391: iso6391,
            voteAverage: voteAverage,
            voteCount: voteCount,
            width: width,
            media: media,
            mediaType: mediaType);
    replace(_$result);
    return _$result;
  }
}
