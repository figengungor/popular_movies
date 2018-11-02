import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcon extends StatelessWidget {
  final String iconPath;
  final String url;
  final String id;
  final double size;

  const SocialIcon(
      {@required this.iconPath,
      @required this.url,
      @required this.id,
      this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return id == null
        ? Container()
        : GestureDetector(
            onTap: () => _launchInBrowser('$url$id'),
            child: Image.asset(
              iconPath,
              width: size,
              height: size,
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
