import 'package:flutter/material.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:popular_movies/data/api_constants.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    String url = "$imageUrl$pathPosterW342${movie.posterPath}";
    double imageWidth = MediaQuery.of(context).size.width / 2;
    return Tooltip(
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
    );
  }
}
