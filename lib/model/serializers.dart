// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:popular_movies/model/belongs_to_collection.dart';
import 'package:popular_movies/model/cast.dart';
import 'package:popular_movies/model/credits.dart';
import 'package:popular_movies/model/crew.dart';
import 'package:popular_movies/model/external_ids.dart';
import 'package:popular_movies/model/genres.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:popular_movies/model/movie_detail.dart';
import 'package:popular_movies/model/movie_response.dart';
import 'package:popular_movies/model/person_detail.dart';
import 'package:popular_movies/model/production_companies.dart';
import 'package:popular_movies/model/production_countries.dart';
import 'package:popular_movies/model/review.dart';
import 'package:popular_movies/model/reviews.dart';
import 'package:popular_movies/model/similar.dart';
import 'package:popular_movies/model/spoken_languages.dart';
import 'package:popular_movies/model/video.dart';
import 'package:popular_movies/model/videos.dart';

part 'serializers.g.dart';

/// Example of how to use built_value serialization.
///
/// Declare a top level [Serializers] field called serializers. Annotate it
/// with [SerializersFor] and provide a `const` `List` of types you want to
/// be serializable.
///
/// The built_value code generator will provide the implementation. It will
/// contain serializers for all the types asked for explicitly plus all the
/// types needed transitively via fields.
///
/// You usually only need to do this once per project.
@SerializersFor(const [
  MovieResponse,
  Movie,
  MovieDetail,
  BelongsToCollection,
  Genres,
  ProductionCompanies,
  ProductionCountries,
  SpokenLanguages,
  Videos,
  Video,
  Reviews,
  Review,
  Credits,
  Cast,
  Crew,
  Similar,
  PersonDetail,
  ExternalIds
])
Serializers serializers = _$serializers;

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
