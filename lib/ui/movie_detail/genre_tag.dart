import 'package:flutter/material.dart';

class GenreTag extends StatelessWidget {
  final String name;
  final Color color;

  GenreTag(this.name, {this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "#$name".toUpperCase(),
        style: TextStyle(
          color: color ?? Theme.of(context).accentColor,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
