enum MovieType {
  Popular,
  TopRated,
  NowPlaying,
}

String getMovieType(MovieType movieType) {
  switch (movieType) {
    case MovieType.Popular:
      return "popular";
    case MovieType.TopRated:
      return "top_rated";
    case MovieType.NowPlaying:
      return "now_playing";
    default:
      throw Exception("MovieType is not defined: $movieType");
  }
}
