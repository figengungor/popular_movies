import 'package:flutter/material.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:popular_movies/data/api_constants.dart';
import 'package:popular_movies/provider/favorite_repo_provider.dart';
import 'package:popular_movies/ui/movie_detail/movie_detail_page.dart';
import 'package:popular_movies/utils/date_utils.dart';

class SearchMovieItem extends StatelessWidget {
  final Movie movie;

  const SearchMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    String url = "$imageUrl$pathPosterW342${movie.posterPath}";
    return ListTile(
      onTap: () {
        _openMovieDetailPage(context, movie);
      },
      leading: CircleAvatar(backgroundImage: NetworkImage(url)),
      title: Text(movie.title),
      subtitle: Text(DateUtils.getYear(movie.releaseDate)),
    );
  }

  void _openMovieDetailPage(BuildContext context, Movie movie) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return MovieDetailPage(
          movie, FavoriteRepoProvider.of(context).favoritesRepository);
    }));
  }
}
