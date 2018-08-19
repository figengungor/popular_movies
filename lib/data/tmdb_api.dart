import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:popular_movies/model/movie_detail.dart';
import 'package:popular_movies/model/movie_response.dart';
import 'package:popular_movies/model/movie_type.dart';
import 'api_key.dart' as config;
import 'api_constants.dart' as apiConstants;

class TmdbApi {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;

  TmdbApi({String baseUrl, String apiKey, HttpClient client})
      : this._baseUrl = baseUrl ?? apiConstants.baseUrl,
        this._apiKey = apiKey ?? config.apiKey,
        this._client = client ?? http.Client();

  Future<MovieResponse> fetchMovies(MovieType movieType, int page) async {
    Uri uri = Uri.https(_baseUrl, "/3/movie/${getMovieType(movieType)}",
        {"page": page.toString()});
    final response = await _getWithAuthorization(uri);
    final results = MovieResponse.fromJson(response.body);
    return results;
  }

  Future<MovieDetail> fetchMovieDetail(int movieId) async {
    Uri uri = Uri.https(_baseUrl, "/3/movie/$movieId",
        {'append_to_response': 'videos,reviews,credits,similar'});
    final response = await _getWithAuthorization(uri);
    final results = MovieDetail.fromJson(response.body);
    return results;
  }

  Future<http.Response> _getWithAuthorization(Uri uri) async {
    final uriWithApiKey = uri
        .replace(
          queryParameters: Map<String, String>.from(uri.queryParameters)
            ..putIfAbsent('api_key', () => _apiKey),
        )
        .toString();
    final response = await _client.get(uriWithApiKey);
    print(uriWithApiKey);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw new TmdbError(response.statusCode, response.body);
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
