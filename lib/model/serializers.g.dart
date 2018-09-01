// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

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

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(BelongsToCollection.serializer)
      ..add(Cast.serializer)
      ..add(Credits.serializer)
      ..add(Crew.serializer)
      ..add(ExternalIds.serializer)
      ..add(Genres.serializer)
      ..add(Movie.serializer)
      ..add(MovieDetail.serializer)
      ..add(MovieResponse.serializer)
      ..add(PersonDetail.serializer)
      ..add(ProductionCompanies.serializer)
      ..add(ProductionCountries.serializer)
      ..add(Review.serializer)
      ..add(Reviews.serializer)
      ..add(Similar.serializer)
      ..add(SpokenLanguages.serializer)
      ..add(TaggedImage.serializer)
      ..add(TaggedImages.serializer)
      ..add(Video.serializer)
      ..add(Videos.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Cast)]),
          () => new ListBuilder<Cast>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Crew)]),
          () => new ListBuilder<Crew>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Genres)]),
          () => new ListBuilder<Genres>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ProductionCompanies)]),
          () => new ListBuilder<ProductionCompanies>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ProductionCountries)]),
          () => new ListBuilder<ProductionCountries>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SpokenLanguages)]),
          () => new ListBuilder<SpokenLanguages>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Movie)]),
          () => new ListBuilder<Movie>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Movie)]),
          () => new ListBuilder<Movie>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Review)]),
          () => new ListBuilder<Review>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TaggedImage)]),
          () => new ListBuilder<TaggedImage>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Video)]),
          () => new ListBuilder<Video>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>()))
    .build();
