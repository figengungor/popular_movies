// GENERATED CODE - DO NOT MODIFY BY HAND

part of movie;

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

Serializer<Movie> _$movieSerializer = new _$MovieSerializer();

class _$MovieSerializer implements StructuredSerializer<Movie> {
  @override
  final Iterable<Type> types = const [Movie, _$Movie];
  @override
  final String wireName = 'Movie';

  @override
  Iterable serialize(Serializers serializers, Movie object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'video',
      serializers.serialize(object.video, specifiedType: const FullType(bool)),
      'vote_average',
      serializers.serialize(object.voteAverage,
          specifiedType: const FullType(double)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'popularity',
      serializers.serialize(object.popularity,
          specifiedType: const FullType(double)),
      'original_language',
      serializers.serialize(object.originalLanguage,
          specifiedType: const FullType(String)),
      'original_title',
      serializers.serialize(object.originalTitle,
          specifiedType: const FullType(String)),
      'adult',
      serializers.serialize(object.adult, specifiedType: const FullType(bool)),
      'overview',
      serializers.serialize(object.overview,
          specifiedType: const FullType(String)),
      'release_date',
      serializers.serialize(object.releaseDate,
          specifiedType: const FullType(String)),
    ];
    if (object.posterPath != null) {
      result
        ..add('poster_path')
        ..add(serializers.serialize(object.posterPath,
            specifiedType: const FullType(String)));
    }
    if (object.genreIds != null) {
      result
        ..add('genre_ids')
        ..add(serializers.serialize(object.genreIds,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    if (object.backdropPath != null) {
      result
        ..add('backdrop_path')
        ..add(serializers.serialize(object.backdropPath,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Movie deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new MovieBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'vote_average':
          result.voteAverage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'popularity':
          result.popularity = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'poster_path':
          result.posterPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'original_language':
          result.originalLanguage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'original_title':
          result.originalTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'genre_ids':
          result.genreIds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'backdrop_path':
          result.backdropPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'adult':
          result.adult = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'overview':
          result.overview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'release_date':
          result.releaseDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Movie extends Movie {
  @override
  final int voteCount;
  @override
  final int id;
  @override
  final bool video;
  @override
  final double voteAverage;
  @override
  final String title;
  @override
  final double popularity;
  @override
  final String posterPath;
  @override
  final String originalLanguage;
  @override
  final String originalTitle;
  @override
  final BuiltList<int> genreIds;
  @override
  final String backdropPath;
  @override
  final bool adult;
  @override
  final String overview;
  @override
  final String releaseDate;

  factory _$Movie([void updates(MovieBuilder b)]) =>
      (new MovieBuilder()..update(updates)).build();

  _$Movie._(
      {this.voteCount,
      this.id,
      this.video,
      this.voteAverage,
      this.title,
      this.popularity,
      this.posterPath,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.backdropPath,
      this.adult,
      this.overview,
      this.releaseDate})
      : super._() {
    if (voteCount == null)
      throw new BuiltValueNullFieldError('Movie', 'voteCount');
    if (id == null) throw new BuiltValueNullFieldError('Movie', 'id');
    if (video == null) throw new BuiltValueNullFieldError('Movie', 'video');
    if (voteAverage == null)
      throw new BuiltValueNullFieldError('Movie', 'voteAverage');
    if (title == null) throw new BuiltValueNullFieldError('Movie', 'title');
    if (popularity == null)
      throw new BuiltValueNullFieldError('Movie', 'popularity');
    if (originalLanguage == null)
      throw new BuiltValueNullFieldError('Movie', 'originalLanguage');
    if (originalTitle == null)
      throw new BuiltValueNullFieldError('Movie', 'originalTitle');
    if (adult == null) throw new BuiltValueNullFieldError('Movie', 'adult');
    if (overview == null)
      throw new BuiltValueNullFieldError('Movie', 'overview');
    if (releaseDate == null)
      throw new BuiltValueNullFieldError('Movie', 'releaseDate');
  }

  @override
  Movie rebuild(void updates(MovieBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieBuilder toBuilder() => new MovieBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Movie) return false;
    return voteCount == other.voteCount &&
        id == other.id &&
        video == other.video &&
        voteAverage == other.voteAverage &&
        title == other.title &&
        popularity == other.popularity &&
        posterPath == other.posterPath &&
        originalLanguage == other.originalLanguage &&
        originalTitle == other.originalTitle &&
        genreIds == other.genreIds &&
        backdropPath == other.backdropPath &&
        adult == other.adult &&
        overview == other.overview &&
        releaseDate == other.releaseDate;
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
                                                        $jc(0,
                                                            voteCount.hashCode),
                                                        id.hashCode),
                                                    video.hashCode),
                                                voteAverage.hashCode),
                                            title.hashCode),
                                        popularity.hashCode),
                                    posterPath.hashCode),
                                originalLanguage.hashCode),
                            originalTitle.hashCode),
                        genreIds.hashCode),
                    backdropPath.hashCode),
                adult.hashCode),
            overview.hashCode),
        releaseDate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Movie')
          ..add('voteCount', voteCount)
          ..add('id', id)
          ..add('video', video)
          ..add('voteAverage', voteAverage)
          ..add('title', title)
          ..add('popularity', popularity)
          ..add('posterPath', posterPath)
          ..add('originalLanguage', originalLanguage)
          ..add('originalTitle', originalTitle)
          ..add('genreIds', genreIds)
          ..add('backdropPath', backdropPath)
          ..add('adult', adult)
          ..add('overview', overview)
          ..add('releaseDate', releaseDate))
        .toString();
  }
}

class MovieBuilder implements Builder<Movie, MovieBuilder> {
  _$Movie _$v;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  bool _video;
  bool get video => _$this._video;
  set video(bool video) => _$this._video = video;

  double _voteAverage;
  double get voteAverage => _$this._voteAverage;
  set voteAverage(double voteAverage) => _$this._voteAverage = voteAverage;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  double _popularity;
  double get popularity => _$this._popularity;
  set popularity(double popularity) => _$this._popularity = popularity;

  String _posterPath;
  String get posterPath => _$this._posterPath;
  set posterPath(String posterPath) => _$this._posterPath = posterPath;

  String _originalLanguage;
  String get originalLanguage => _$this._originalLanguage;
  set originalLanguage(String originalLanguage) =>
      _$this._originalLanguage = originalLanguage;

  String _originalTitle;
  String get originalTitle => _$this._originalTitle;
  set originalTitle(String originalTitle) =>
      _$this._originalTitle = originalTitle;

  ListBuilder<int> _genreIds;
  ListBuilder<int> get genreIds => _$this._genreIds ??= new ListBuilder<int>();
  set genreIds(ListBuilder<int> genreIds) => _$this._genreIds = genreIds;

  String _backdropPath;
  String get backdropPath => _$this._backdropPath;
  set backdropPath(String backdropPath) => _$this._backdropPath = backdropPath;

  bool _adult;
  bool get adult => _$this._adult;
  set adult(bool adult) => _$this._adult = adult;

  String _overview;
  String get overview => _$this._overview;
  set overview(String overview) => _$this._overview = overview;

  String _releaseDate;
  String get releaseDate => _$this._releaseDate;
  set releaseDate(String releaseDate) => _$this._releaseDate = releaseDate;

  MovieBuilder();

  MovieBuilder get _$this {
    if (_$v != null) {
      _voteCount = _$v.voteCount;
      _id = _$v.id;
      _video = _$v.video;
      _voteAverage = _$v.voteAverage;
      _title = _$v.title;
      _popularity = _$v.popularity;
      _posterPath = _$v.posterPath;
      _originalLanguage = _$v.originalLanguage;
      _originalTitle = _$v.originalTitle;
      _genreIds = _$v.genreIds?.toBuilder();
      _backdropPath = _$v.backdropPath;
      _adult = _$v.adult;
      _overview = _$v.overview;
      _releaseDate = _$v.releaseDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Movie other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Movie;
  }

  @override
  void update(void updates(MovieBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Movie build() {
    _$Movie _$result;
    try {
      _$result = _$v ??
          new _$Movie._(
              voteCount: voteCount,
              id: id,
              video: video,
              voteAverage: voteAverage,
              title: title,
              popularity: popularity,
              posterPath: posterPath,
              originalLanguage: originalLanguage,
              originalTitle: originalTitle,
              genreIds: _genreIds?.build(),
              backdropPath: backdropPath,
              adult: adult,
              overview: overview,
              releaseDate: releaseDate);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'genreIds';
        _genreIds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Movie', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
