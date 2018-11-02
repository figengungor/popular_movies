import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:popular_movies/l10n/localizations.dart';
import 'package:popular_movies/model/video.dart';
import 'package:popular_movies/model/videos.dart';
import 'package:popular_movies/ui/movie_detail/section_header.dart';
import 'package:url_launcher/url_launcher.dart';

class VideosSection extends StatelessWidget {
  final Videos videos;
  static const double _videoHeight = 100.0;

  const VideosSection(this.videos);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SectionHeader(AppLocalizations.of(context).videosTitle),
        _buildVideoList(context),
      ],
    );
  }

  Widget _buildVideoList(BuildContext context) {
    if (videos != null && videos.results != null && videos.results.isNotEmpty) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: videos.results.map(_buildVideoItem).toList(),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(AppLocalizations.of(context).noVideosFound),
      );
    }
  }

  Widget _buildVideoItem(Video video) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () =>
            _launchInBrowser('http://www.youtube.com/watch?v=${video.key}'),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CachedNetworkImage(
              height: _videoHeight,
              imageUrl: 'https://i1.ytimg.com/vi/${video.key}/mqdefault.jpg',
              placeholder: Image.asset(
                'assets/images/placeholder_backdrop.png',
                height: _videoHeight,
                fit: BoxFit.cover,
              ),
              errorWidget: Image.asset(
                'assets/images/error_backdrop.png',
                height: _videoHeight,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 46.0,
              height: 46.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.4),
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 32.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
