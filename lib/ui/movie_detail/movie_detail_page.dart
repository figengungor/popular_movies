import 'package:built_collection/src/list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:popular_movies/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:popular_movies/bloc/favorite_movies_bloc/favorites_repository.dart';
import 'package:popular_movies/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:popular_movies/bloc/movie_detail_bloc/movie_detail_repository.dart';
import 'package:popular_movies/bloc/settings_bloc/settings_repository.dart';
import 'package:popular_movies/l10n/localizations.dart';
import 'package:popular_movies/model/genres.dart';
import 'package:popular_movies/model/movie.dart';
import 'package:popular_movies/data/api_constants.dart';
import 'package:popular_movies/model/movie_detail.dart';
import 'package:popular_movies/ui/movie_detail/cast_section.dart';
import 'package:popular_movies/ui/movie_detail/genre_tag.dart';
import 'package:popular_movies/ui/movie_detail/reviews_section.dart';
import 'package:popular_movies/ui/movie_detail/similar_section.dart';
import 'package:popular_movies/ui/movie_detail/videos_section.dart';
import 'package:popular_movies/utils/error_utils.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;
  final FavoritesRepository repo;

  MovieDetailPage(this.movie, this.repo);

  @override
  MovieDetailPageState createState() {
    return new MovieDetailPageState();
  }
}

class MovieDetailPageState extends State<MovieDetailPage> {
  MovieDetailBloc bloc;
  FavoriteBloc favoriteBloc;

  @override
  void initState() {
    bloc = MovieDetailBloc(
        widget.movie.id, MovieDetailRepository(), SettingsRepository());

    bloc.fetchMovieDetailSink.add(null);
    favoriteBloc = FavoriteBloc(widget.repo, widget.movie);
    favoriteBloc.checkStatusSink.add(null);

    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String backdropUrl =
        "$imageUrl$pathBackdropW780${widget.movie.backdropPath}";
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 256.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                fadeInDuration: Duration(milliseconds: 0),
                fit: BoxFit.cover,
                imageUrl: backdropUrl,
                placeholder: Image.asset(
                  'assets/images/placeholder_backdrop.png',
                  fit: BoxFit.cover,
                ),
                errorWidget: Image.asset(
                  'assets/images/error_backdrop.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildHeader(),
              _buildOverview(),
              _buildDetails(),
            ]),
          )
        ],
      ),
    );
  }

  Widget _buildDetails() {
    return StreamBuilder(
        stream: bloc.movieDetail,
        builder: (BuildContext context, AsyncSnapshot<MovieDetail> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildGenres(snapshot.data.genres),
                  SizedBox(height: 16.0),
                  VideosSection(snapshot.data.videos),
                  SizedBox(height: 16.0),
                  ReviewsSection(snapshot.data.reviews),
                  SizedBox(height: 16.0),
                  CastSection(snapshot.data.credits),
                  SizedBox(height: 16.0),
                  SimilarSection(snapshot.data.similar),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '${AppLocalizations.of(context).movieDetailFetchError}'
                        '${ErrorUtils.getFriendlyNetworkErrorMessage(context, snapshot.error)}',
                    textAlign: TextAlign.center,
                  ),
                  FlatButton(
                    onPressed: _onRetry,
                    textColor: Theme.of(context).accentColor,
                    child: Text(AppLocalizations.of(context).retry),
                  )
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }

  Widget _buildGenres(BuiltList<Genres> genres) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: genres
            .map((genre) => Row(
                  children: <Widget>[
                    GenreTag(genre.name),
                    SizedBox(
                      width: 16.0,
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }

  Widget _buildOverview() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.movie.overview,
        style: TextStyle(fontSize: 15.0),
      ),
    );
  }

  Widget _buildHeader() {
    String posterUrl = "$imageUrl$pathPosterW342${widget.movie.posterPath}";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: posterUrl,
            placeholder: Image.asset(
              'assets/images/placeholder_poster.png',
              width: 120.0,
              fit: BoxFit.cover,
            ),
            errorWidget: Image.asset(
              'assets/images/error_poster.png',
              width: 120.0,
              fit: BoxFit.cover,
            ),
            width: 120.0,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    widget.movie.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26.0),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  RichText(
                    text: TextSpan(
                        text: '${widget.movie.voteAverage}',
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Theme.of(context).accentColor),
                        children: [
                          TextSpan(
                              text: '/10', style: TextStyle(fontSize: 18.0)),
                        ]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.date_range,
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        widget.movie.releaseDate,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  _buildFavoriteButton(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onRetry() {
    bloc.fetchMovieDetailSink.add(null);
  }

  _buildFavoriteButton() {
    return StreamBuilder(
        initialData: false,
        stream: favoriteBloc.status,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return FloatingActionButton(
            onPressed: () {
              favoriteBloc.updateStatusSink.add(null);
            },
            child: Icon(snapshot.data ? Icons.favorite : Icons.favorite_border),
          );
        });
  }
}
