import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:popular_movies/model/cast.dart';
import 'package:popular_movies/model/credits.dart';
import 'package:popular_movies/model/crew.dart';
import 'package:popular_movies/pages/movie_detail/section_header.dart';
import 'package:popular_movies/data/api_constants.dart';

class CastSection extends StatelessWidget {
  final Credits credits;

  CastSection(this.credits);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SectionHeader('Cast'),
        _buildCastList(context),
        _buildDirectorAndWriter(),
      ],
    );
  }

  Widget _buildCastList(BuildContext context) {
    if (credits != null && credits.cast != null && credits.cast.length > 0) {
      double imageWidth = MediaQuery.of(context).size.width / 4;
      double imageHeight = imageWidth * (3 / 2);
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: credits.cast
              .map((cast) => _buildCastItem(cast, imageWidth, imageHeight))
              .toList(),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('No cast found'),
      );
    }
  }

  Widget _buildCastItem(Cast cast, double imageWidth, double imageHeight) {
    String profileUrl = "$imageUrl$pathPosterW342${cast.profilePath}";
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: profileUrl,
            width: imageWidth,
            height: imageHeight,
            placeholder: Image.asset(
              'assets/images/placeholder_poster.png',
              width: imageWidth,
              height: imageHeight,
            ),
            errorWidget: Image.asset(
              'assets/images/error_poster.png',
              width: imageWidth,
              height: imageHeight,
            ),
            fit: BoxFit.cover,
          ),
          Text(cast.name)
        ],
      ),
    );
  }

  _buildDirectorAndWriter() {
    List<String> directors = [];
    List<String> writers = [];

    if (credits != null && credits.crew != null && credits.crew.length > 0) {
      for (Crew crew in credits.crew) {
        if (crew.job == "Director") {
          directors.add(crew.name);
        }
        if (crew.job == "Screenplay") {
          writers.add(crew.name);
        }
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 16.0),
        SectionHeader('Directors'),
        Text(directors.isEmpty ? '-' : directors.join(", ")),
        SizedBox(height: 16.0),
        SectionHeader('Writers'),
        Text(writers.isEmpty ? '-' : writers.join(", ")),
      ],
    );
  }
}