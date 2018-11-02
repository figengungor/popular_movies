import 'package:flutter/material.dart';
import 'package:popular_movies/l10n/localizations.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeMorePressed;

  const SectionHeader(this.title, {this.onSeeMorePressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            onSeeMorePressed != null
                ? FlatButton(
                    color: Theme.of(context).accentColor,
                    child: Text(AppLocalizations.of(context).seeMore),
                    onPressed: onSeeMorePressed,
                  )
                : Container()
          ],
        ),
        const Divider(),
      ],
    );
  }
}
