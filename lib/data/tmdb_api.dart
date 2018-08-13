import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:popular_movies/model/movie_response.dart';
import 'package:popular_movies/model/movie_type.dart';
import 'api_key.dart';
import 'api_constants.dart' as apiConstants;

class TmdbApi {
  final String baseUrl;
  final http.Client client;

  TmdbApi({this.baseUrl = apiConstants.baseUrl, HttpClient client})
      : this.client = client ?? http.Client();

  Future<MovieResponse> fetchMovies(MovieType movieType) async {
    Uri uri = Uri.https(baseUrl, "/3/movie/${getMovieType(movieType)}");
    final response = await _getWithAuthorization(uri);
    final results = MovieResponse.fromJson(response.body);
    return results;
  }

  Future<http.Response> _getWithAuthorization(Uri uri) async {
    final uriWithApiKey = uri
        .replace(
          queryParameters: new Map<String, String>.from(uri.queryParameters)
            ..putIfAbsent('api_key', () => apiKey),
        )
        .toString();
    final response = await client.get(uriWithApiKey);
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
