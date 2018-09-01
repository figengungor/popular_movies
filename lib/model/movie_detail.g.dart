// GENERATED CODE - DO NOT MODIFY BY HAND

part of movie_detail;

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

Serializer<MovieDetail> _$movieDetailSerializer = new _$MovieDetailSerializer();

class _$MovieDetailSerializer implements StructuredSerializer<MovieDetail> {
  @override
  final Iterable<Type> types = const [MovieDetail, _$MovieDetail];
  @override
  final String wireName = 'MovieDetail';

  @override
  Iterable serialize(Serializers serializers, MovieDetail object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'adult',
      serializers.serialize(object.adult, specifiedType: const FullType(bool)),
      'budget',
      serializers.serialize(object.budget, specifiedType: const FullType(int)),
      'genres',
      serializers.serialize(object.genres,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Genres)])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'original_language',
      serializers.serialize(object.originalLanguage,
          specifiedType: const FullType(String)),
      'original_title',
      serializers.serialize(object.originalTitle,
          specifiedType: const FullType(String)),
      'popularity',
      serializers.serialize(object.popularity,
          specifiedType: const FullType(double)),
      'production_companies',
      serializers.serialize(object.productionCompanies,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ProductionCompanies)])),
      'production_countries',
      serializers.serialize(object.productionCountries,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ProductionCountries)])),
      'release_date',
      serializers.serialize(object.releaseDate,
          specifiedType: const FullType(String)),
      'revenue',
      serializers.serialize(object.revenue, specifiedType: const FullType(int)),
      'spoken_languages',
      serializers.serialize(object.spokenLanguages,
          specifiedType: const FullType(
              BuiltList, const [const FullType(SpokenLanguages)])),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'video',
      serializers.serialize(object.video, specifiedType: const FullType(bool)),
      'vote_average',
      serializers.serialize(object.voteAverage,
          specifiedType: const FullType(double)),
      'vote_count',
      serializers.serialize(object.voteCount,
          specifiedType: const FullType(int)),
      'videos',
      serializers.serialize(object.videos,
          specifiedType: const FullType(Videos)),
      'credits',
      serializers.serialize(object.credits,
          specifiedType: const FullType(Credits)),
      'similar',
      serializers.serialize(object.similar,
          specifiedType: const FullType(Similar)),
    ];
    if (object.backdropPath != null) {
      result
        ..add('backdrop_path')
        ..add(serializers.serialize(object.backdropPath,
            specifiedType: const FullType(String)));
    }
    if (object.belongsToCollection != null) {
      result
        ..add('belongs_to_collection')
        ..add(serializers.serialize(object.belongsToCollection,
            specifiedType: const FullType(BelongsToCollection)));
    }
    if (object.homepage != null) {
      result
        ..add('homepage')
        ..add(serializers.serialize(object.homepage,
            specifiedType: const FullType(String)));
    }
    if (object.imdbId != null) {
      result
        ..add('imdb_id')
        ..add(serializers.serialize(object.imdbId,
            specifiedType: const FullType(String)));
    }
    if (object.overview != null) {
      result
        ..add('overview')
        ..add(serializers.serialize(object.overview,
            specifiedType: const FullType(String)));
    }
    if (object.posterPath != null) {
      result
        ..add('poster_path')
        ..add(serializers.serialize(object.posterPath,
            specifiedType: const FullType(String)));
    }
    if (object.runtime != null) {
      result
        ..add('runtime')
        ..add(serializers.serialize(object.runtime,
            specifiedType: const FullType(int)));
    }
    if (object.tagline != null) {
      result
        ..add('tagline')
        ..add(serializers.serialize(object.tagline,
            specifiedType: const FullType(String)));
    }
    if (object.reviews != null) {
      result
        ..add('reviews')
        ..add(serializers.serialize(object.reviews,
            specifiedType: const FullType(Reviews)));
    }

    return result;
  }

  @override
  MovieDetail deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovieDetailBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'adult':
          result.adult = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'backdrop_path':
          result.backdropPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'belongs_to_collection':
          result.belongsToCollection.replace(serializers.deserialize(value,
                  specifiedType: const FullType(BelongsToCollection))
              as BelongsToCollection);
          break;
        case 'budget':
          result.budget = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'genres':
          result.genres.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Genres)]))
              as BuiltList);
          break;
        case 'homepage':
          result.homepage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'imdb_id':
          result.imdbId = serializers.deserialize(value,
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
        case 'overview':
          result.overview = serializers.deserialize(value,
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
        case 'production_companies':
          result.productionCompanies.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProductionCompanies)]))
              as BuiltList);
          break;
        case 'production_countries':
          result.productionCountries.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProductionCountries)]))
              as BuiltList);
          break;
        case 'release_date':
          result.releaseDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'revenue':
          result.revenue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'runtime':
          result.runtime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'spoken_languages':
          result.spokenLanguages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SpokenLanguages)]))
              as BuiltList);
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tagline':
          result.tagline = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'vote_average':
          result.voteAverage = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'vote_count':
          result.voteCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'videos':
          result.videos.replace(serializers.deserialize(value,
              specifiedType: const FullType(Videos)) as Videos);
          break;
        case 'reviews':
          result.reviews.replace(serializers.deserialize(value,
              specifiedType: const FullType(Reviews)) as Reviews);
          break;
        case 'credits':
          result.credits.replace(serializers.deserialize(value,
              specifiedType: const FullType(Credits)) as Credits);
          break;
        case 'similar':
          result.similar.replace(serializers.deserialize(value,
              specifiedType: const FullType(Similar)) as Similar);
          break;
      }
    }

    return result.build();
  }
}

class _$MovieDetail extends MovieDetail {
  @override
  final bool adult;
  @override
  final String backdropPath;
  @override
  final BelongsToCollection belongsToCollection;
  @override
  final int budget;
  @override
  final BuiltList<Genres> genres;
  @override
  final String homepage;
  @override
  final int id;
  @override
  final String imdbId;
  @override
  final String originalLanguage;
  @override
  final String originalTitle;
  @override
  final String overview;
  @override
  final double popularity;
  @override
  final String posterPath;
  @override
  final BuiltList<ProductionCompanies> productionCompanies;
  @override
  final BuiltList<ProductionCountries> productionCountries;
  @override
  final String releaseDate;
  @override
  final int revenue;
  @override
  final int runtime;
  @override
  final BuiltList<SpokenLanguages> spokenLanguages;
  @override
  final String status;
  @override
  final String tagline;
  @override
  final String title;
  @override
  final bool video;
  @override
  final double voteAverage;
  @override
  final int voteCount;
  @override
  final Videos videos;
  @override
  final Reviews reviews;
  @override
  final Credits credits;
  @override
  final Similar similar;

  factory _$MovieDetail([void updates(MovieDetailBuilder b)]) =>
      (new MovieDetailBuilder()..update(updates)).build();

  _$MovieDetail._(
      {this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.videos,
      this.reviews,
      this.credits,
      this.similar})
      : super._() {
    if (adult == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'adult');
    if (budget == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'budget');
    if (genres == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'genres');
    if (id == null) throw new BuiltValueNullFieldError('MovieDetail', 'id');
    if (originalLanguage == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'originalLanguage');
    if (originalTitle == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'originalTitle');
    if (popularity == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'popularity');
    if (productionCompanies == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'productionCompanies');
    if (productionCountries == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'productionCountries');
    if (releaseDate == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'releaseDate');
    if (revenue == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'revenue');
    if (spokenLanguages == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'spokenLanguages');
    if (status == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'status');
    if (title == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'title');
    if (video == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'video');
    if (voteAverage == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'voteAverage');
    if (voteCount == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'voteCount');
    if (videos == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'videos');
    if (credits == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'credits');
    if (similar == null)
      throw new BuiltValueNullFieldError('MovieDetail', 'similar');
  }

  @override
  MovieDetail rebuild(void updates(MovieDetailBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MovieDetailBuilder toBuilder() => new MovieDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovieDetail &&
        adult == other.adult &&
        backdropPath == other.backdropPath &&
        belongsToCollection == other.belongsToCollection &&
        budget == other.budget &&
        genres == other.genres &&
        homepage == other.homepage &&
        id == other.id &&
        imdbId == other.imdbId &&
        originalLanguage == other.originalLanguage &&
        originalTitle == other.originalTitle &&
        overview == other.overview &&
        popularity == other.popularity &&
        posterPath == other.posterPath &&
        productionCompanies == other.productionCompanies &&
        productionCountries == other.productionCountries &&
        releaseDate == other.releaseDate &&
        revenue == other.revenue &&
        runtime == other.runtime &&
        spokenLanguages == other.spokenLanguages &&
        status == other.status &&
        tagline == other.tagline &&
        title == other.title &&
        video == other.video &&
        voteAverage == other.voteAverage &&
        voteCount == other.voteCount &&
        videos == other.videos &&
        reviews == other.reviews &&
        credits == other.credits &&
        similar == other.similar;
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
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, adult.hashCode), backdropPath.hashCode), belongsToCollection.hashCode), budget.hashCode), genres.hashCode), homepage.hashCode), id.hashCode), imdbId.hashCode), originalLanguage.hashCode), originalTitle.hashCode),
                                                                                overview.hashCode),
                                                                            popularity.hashCode),
                                                                        posterPath.hashCode),
                                                                    productionCompanies.hashCode),
                                                                productionCountries.hashCode),
                                                            releaseDate.hashCode),
                                                        revenue.hashCode),
                                                    runtime.hashCode),
                                                spokenLanguages.hashCode),
                                            status.hashCode),
                                        tagline.hashCode),
                                    title.hashCode),
                                video.hashCode),
                            voteAverage.hashCode),
                        voteCount.hashCode),
                    videos.hashCode),
                reviews.hashCode),
            credits.hashCode),
        similar.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MovieDetail')
          ..add('adult', adult)
          ..add('backdropPath', backdropPath)
          ..add('belongsToCollection', belongsToCollection)
          ..add('budget', budget)
          ..add('genres', genres)
          ..add('homepage', homepage)
          ..add('id', id)
          ..add('imdbId', imdbId)
          ..add('originalLanguage', originalLanguage)
          ..add('originalTitle', originalTitle)
          ..add('overview', overview)
          ..add('popularity', popularity)
          ..add('posterPath', posterPath)
          ..add('productionCompanies', productionCompanies)
          ..add('productionCountries', productionCountries)
          ..add('releaseDate', releaseDate)
          ..add('revenue', revenue)
          ..add('runtime', runtime)
          ..add('spokenLanguages', spokenLanguages)
          ..add('status', status)
          ..add('tagline', tagline)
          ..add('title', title)
          ..add('video', video)
          ..add('voteAverage', voteAverage)
          ..add('voteCount', voteCount)
          ..add('videos', videos)
          ..add('reviews', reviews)
          ..add('credits', credits)
          ..add('similar', similar))
        .toString();
  }
}

class MovieDetailBuilder implements Builder<MovieDetail, MovieDetailBuilder> {
  _$MovieDetail _$v;

  bool _adult;
  bool get adult => _$this._adult;
  set adult(bool adult) => _$this._adult = adult;

  String _backdropPath;
  String get backdropPath => _$this._backdropPath;
  set backdropPath(String backdropPath) => _$this._backdropPath = backdropPath;

  BelongsToCollectionBuilder _belongsToCollection;
  BelongsToCollectionBuilder get belongsToCollection =>
      _$this._belongsToCollection ??= new BelongsToCollectionBuilder();
  set belongsToCollection(BelongsToCollectionBuilder belongsToCollection) =>
      _$this._belongsToCollection = belongsToCollection;

  int _budget;
  int get budget => _$this._budget;
  set budget(int budget) => _$this._budget = budget;

  ListBuilder<Genres> _genres;
  ListBuilder<Genres> get genres =>
      _$this._genres ??= new ListBuilder<Genres>();
  set genres(ListBuilder<Genres> genres) => _$this._genres = genres;

  String _homepage;
  String get homepage => _$this._homepage;
  set homepage(String homepage) => _$this._homepage = homepage;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _imdbId;
  String get imdbId => _$this._imdbId;
  set imdbId(String imdbId) => _$this._imdbId = imdbId;

  String _originalLanguage;
  String get originalLanguage => _$this._originalLanguage;
  set originalLanguage(String originalLanguage) =>
      _$this._originalLanguage = originalLanguage;

  String _originalTitle;
  String get originalTitle => _$this._originalTitle;
  set originalTitle(String originalTitle) =>
      _$this._originalTitle = originalTitle;

  String _overview;
  String get overview => _$this._overview;
  set overview(String overview) => _$this._overview = overview;

  double _popularity;
  double get popularity => _$this._popularity;
  set popularity(double popularity) => _$this._popularity = popularity;

  String _posterPath;
  String get posterPath => _$this._posterPath;
  set posterPath(String posterPath) => _$this._posterPath = posterPath;

  ListBuilder<ProductionCompanies> _productionCompanies;
  ListBuilder<ProductionCompanies> get productionCompanies =>
      _$this._productionCompanies ??= new ListBuilder<ProductionCompanies>();
  set productionCompanies(
          ListBuilder<ProductionCompanies> productionCompanies) =>
      _$this._productionCompanies = productionCompanies;

  ListBuilder<ProductionCountries> _productionCountries;
  ListBuilder<ProductionCountries> get productionCountries =>
      _$this._productionCountries ??= new ListBuilder<ProductionCountries>();
  set productionCountries(
          ListBuilder<ProductionCountries> productionCountries) =>
      _$this._productionCountries = productionCountries;

  String _releaseDate;
  String get releaseDate => _$this._releaseDate;
  set releaseDate(String releaseDate) => _$this._releaseDate = releaseDate;

  int _revenue;
  int get revenue => _$this._revenue;
  set revenue(int revenue) => _$this._revenue = revenue;

  int _runtime;
  int get runtime => _$this._runtime;
  set runtime(int runtime) => _$this._runtime = runtime;

  ListBuilder<SpokenLanguages> _spokenLanguages;
  ListBuilder<SpokenLanguages> get spokenLanguages =>
      _$this._spokenLanguages ??= new ListBuilder<SpokenLanguages>();
  set spokenLanguages(ListBuilder<SpokenLanguages> spokenLanguages) =>
      _$this._spokenLanguages = spokenLanguages;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _tagline;
  String get tagline => _$this._tagline;
  set tagline(String tagline) => _$this._tagline = tagline;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  bool _video;
  bool get video => _$this._video;
  set video(bool video) => _$this._video = video;

  double _voteAverage;
  double get voteAverage => _$this._voteAverage;
  set voteAverage(double voteAverage) => _$this._voteAverage = voteAverage;

  int _voteCount;
  int get voteCount => _$this._voteCount;
  set voteCount(int voteCount) => _$this._voteCount = voteCount;

  VideosBuilder _videos;
  VideosBuilder get videos => _$this._videos ??= new VideosBuilder();
  set videos(VideosBuilder videos) => _$this._videos = videos;

  ReviewsBuilder _reviews;
  ReviewsBuilder get reviews => _$this._reviews ??= new ReviewsBuilder();
  set reviews(ReviewsBuilder reviews) => _$this._reviews = reviews;

  CreditsBuilder _credits;
  CreditsBuilder get credits => _$this._credits ??= new CreditsBuilder();
  set credits(CreditsBuilder credits) => _$this._credits = credits;

  SimilarBuilder _similar;
  SimilarBuilder get similar => _$this._similar ??= new SimilarBuilder();
  set similar(SimilarBuilder similar) => _$this._similar = similar;

  MovieDetailBuilder();

  MovieDetailBuilder get _$this {
    if (_$v != null) {
      _adult = _$v.adult;
      _backdropPath = _$v.backdropPath;
      _belongsToCollection = _$v.belongsToCollection?.toBuilder();
      _budget = _$v.budget;
      _genres = _$v.genres?.toBuilder();
      _homepage = _$v.homepage;
      _id = _$v.id;
      _imdbId = _$v.imdbId;
      _originalLanguage = _$v.originalLanguage;
      _originalTitle = _$v.originalTitle;
      _overview = _$v.overview;
      _popularity = _$v.popularity;
      _posterPath = _$v.posterPath;
      _productionCompanies = _$v.productionCompanies?.toBuilder();
      _productionCountries = _$v.productionCountries?.toBuilder();
      _releaseDate = _$v.releaseDate;
      _revenue = _$v.revenue;
      _runtime = _$v.runtime;
      _spokenLanguages = _$v.spokenLanguages?.toBuilder();
      _status = _$v.status;
      _tagline = _$v.tagline;
      _title = _$v.title;
      _video = _$v.video;
      _voteAverage = _$v.voteAverage;
      _voteCount = _$v.voteCount;
      _videos = _$v.videos?.toBuilder();
      _reviews = _$v.reviews?.toBuilder();
      _credits = _$v.credits?.toBuilder();
      _similar = _$v.similar?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovieDetail other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$MovieDetail;
  }

  @override
  void update(void updates(MovieDetailBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MovieDetail build() {
    _$MovieDetail _$result;
    try {
      _$result = _$v ??
          new _$MovieDetail._(
              adult: adult,
              backdropPath: backdropPath,
              belongsToCollection: _belongsToCollection?.build(),
              budget: budget,
              genres: genres.build(),
              homepage: homepage,
              id: id,
              imdbId: imdbId,
              originalLanguage: originalLanguage,
              originalTitle: originalTitle,
              overview: overview,
              popularity: popularity,
              posterPath: posterPath,
              productionCompanies: productionCompanies.build(),
              productionCountries: productionCountries.build(),
              releaseDate: releaseDate,
              revenue: revenue,
              runtime: runtime,
              spokenLanguages: spokenLanguages.build(),
              status: status,
              tagline: tagline,
              title: title,
              video: video,
              voteAverage: voteAverage,
              voteCount: voteCount,
              videos: videos.build(),
              reviews: _reviews?.build(),
              credits: credits.build(),
              similar: similar.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'belongsToCollection';
        _belongsToCollection?.build();

        _$failedField = 'genres';
        genres.build();

        _$failedField = 'productionCompanies';
        productionCompanies.build();
        _$failedField = 'productionCountries';
        productionCountries.build();

        _$failedField = 'spokenLanguages';
        spokenLanguages.build();

        _$failedField = 'videos';
        videos.build();
        _$failedField = 'reviews';
        _reviews?.build();
        _$failedField = 'credits';
        credits.build();
        _$failedField = 'similar';
        similar.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MovieDetail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
