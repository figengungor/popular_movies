import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeMorePressed;

  SectionHeader(this.title, {this.onSeeMorePressed});

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
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            onSeeMorePressed != null
                ? FlatButton(
                    color: Theme.of(context).accentColor,
                    child: Text('SEE MORE'),
                    onPressed: onSeeMorePressed,
                  )
                : Container()
          ],
        ),
        Divider(),
      ],
    );
  }
}
