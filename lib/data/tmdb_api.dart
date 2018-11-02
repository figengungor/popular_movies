import 'dart:async';
import 'dart:io';
import 'package:popular_movies/model/movie_detail.dart';
import 'package:popular_movies/model/movie_response.dart';
import 'package:popular_movies/model/movie_type.dart';
import 'package:popular_movies/model/person_detail.dart';
import 'package:popular_movies/model/tagged_images.dart';
import 'package:http/http.dart' as http;
import 'api_constants.dart' as api_constants;
import 'api_key.dart' as config;

class TmdbApi {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;

  TmdbApi({String baseUrl, String apiKey, HttpClient client})
      : this._baseUrl = baseUrl ?? api_constants.baseUrl,
        this._apiKey = apiKey ?? config.apiKey,
        this._client = client ?? http.Client();

  Future<MovieResponse> fetchMovies(
      MovieType movieType, int page, String language) async {
    final Uri uri = Uri.https(
      _baseUrl,
      '/3/movie/${getMovieType(movieType)}',
      <String, String>{
        'page': page.toString(),
        'language': language,
      },
    );
    final http.Response response = await _getWithAuthorization(uri);
    final MovieResponse results = MovieResponse.fromJson(response.body);
    return results;
  }

  Future<MovieDetail> fetchMovieDetail(int movieId, String language) async {
    final Uri uri = Uri.https(
      _baseUrl,
      '/3/movie/$movieId',
      <String, String>{
        'language': language,
        'append_to_response': 'videos,reviews,credits,similar'
      },
    );
    final http.Response response = await _getWithAuthorization(uri);
    final MovieDetail results = MovieDetail.fromJson(response.body);
    return results;
  }

  Future<MovieResponse> searchMovies(
      String query, int page, String language) async {
    final Uri uri = Uri.https(_baseUrl, '/3/search/movie',
        {'query': query, 'page': page.toString(), 'language': language});
    final http.Response response = await _getWithAuthorization(uri);
    final MovieResponse results = MovieResponse.fromJson(response.body);
    return results;
  }

  Future<PersonDetail> fetchPersonDetail(int personId, String language) async {
    Uri uri = Uri.https(_baseUrl, '/3/person/$personId', {
      'language': language,
      'append_to_response': 'external_ids,tagged_images'
    });
    final http.Response response = await _getWithAuthorization(uri);
    final PersonDetail results = PersonDetail.fromJson(response.body);
    return results;
  }

  Future<TaggedImages> fetchTaggedImages(int personId, String language) async {
    Uri uri = Uri.https(_baseUrl, '/3/person/$personId/tagged_images', {
      'language': language,
    });
    final http.Response response = await _getWithAuthorization(uri);
    final TaggedImages results = TaggedImages.fromJson(response.body);
    return results;
  }

  Future<http.Response> _getWithAuthorization(Uri uri) async {
    final String uriWithApiKey = uri
        .replace(
          queryParameters: Map<String, String>.from(uri.queryParameters)
            ..putIfAbsent('api_key', () => _apiKey),
        )
        .toString();
    final http.Response response = await _client.get(uriWithApiKey);
    print(uriWithApiKey);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw TmdbError(response.statusCode, response.body);
    }
  }
}

class TmdbError {
  final int statusCode;
  final String exception;

  TmdbError(this.statusCode, this.exception);

  @override
  String toString() {
    return 'TmdbError{statusCode: $statusCode, exception: $exception}';
  }
}
