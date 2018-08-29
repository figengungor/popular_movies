import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:popular_movies/provider/favorite_repo_provider.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:popular_movies/model/similar.dart';
import 'package:popular_movies/ui/movie_detail/movie_detail_page.dart';
import 'package:popular_movies/ui/movie_detail/section_header.dart';
import 'package:popular_movies/data/api_constants.dart';

class SimilarSection extends StatelessWidget {
  final Similar similar;

  SimilarSection(this.similar);

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / 4;
    return Column(
      children: <Widget>[
        SectionHeader('Similar Movies'),
        _buildSimilarMoviesList(context, itemWidth)
      ],
    );
  }

  _buildSimilarMoviesList(BuildContext context, double itemWidth) {
    if (similar != null &&
        similar.results != null &&
        similar.results.isNotEmpty) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: similar.results
              .map(
                (Movie movie) => InkWell(
                      onTap: () => _openMovieDetail(context, movie),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: itemWidth,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              CachedNetworkImage(
                                imageUrl:
                                    "$imageUrl$pathPosterW342${movie.posterPath}",
                                placeholder: Image.asset(
                                  'assets/images/placeholder_poster.png',
                                  fit: BoxFit.cover,
                                ),
                                errorWidget: Image.asset(
                                  'assets/images/error_poster.png',
                                  fit: BoxFit.cover,
                                ),
                                width: itemWidth,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                movie.title,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              )
              .toList(),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('No similar movies found'),
      );
    }
  }

  void _openMovieDetail(BuildContext context, Movie movie) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return MovieDetailPage(
          movie, FavoriteRepoProvider.of(context).favoritesRepository);
    }));
  }
}
