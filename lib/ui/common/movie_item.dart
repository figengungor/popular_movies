import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:popular_movies/data/api_constants.dart';
import 'package:popular_movies/provider/favorite_repo_provider.dart';
import 'package:popular_movies/ui/movie_detail/movie_detail_page.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    String url = "$imageUrl$pathPosterW342${movie.posterPath}";
    double imageWidth = MediaQuery.of(context).size.width / 2;
    return GestureDetector(
      onTap: () {
        _openMovieDetailPage(context, movie);
      },
      child: Tooltip(
        message: movie.title,
        child: CachedNetworkImage(
          placeholder: Image.asset('assets/images/placeholder_poster.png'),
          errorWidget: Stack(
            children: <Widget>[
              Image.asset('assets/images/error_poster.png'),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.bottomCenter,
                child: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          imageUrl: url,
          width: imageWidth,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _openMovieDetailPage(BuildContext context, Movie movie) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return MovieDetailPage(movie, FavoriteRepoProvider.of(context).favoritesRepository);
    }));
  }
}
