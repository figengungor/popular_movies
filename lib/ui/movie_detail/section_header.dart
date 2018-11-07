import 'package:flutter/material.dart';
import 'package:popular_movies/l10n/localizations.dart';
import 'package:popular_movies/ui/common/label_clipper.dart';

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
              child: ClipPath(
                clipper: LabelClipper(10.0),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 18.0, top: 4.0, bottom: 4.0),
                  color: Colors.black,
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
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
        //const Divider(),
        const SizedBox(height: 8.0)
      ],
    );
  }
}
