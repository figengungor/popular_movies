import 'package:flutter/material.dart';

class GenreTag extends StatelessWidget {
  const GenreTag(this.name, {this.color});
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '#$name'.toUpperCase(),
        style: TextStyle(
          color: color ?? Theme.of(context).accentColor,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
