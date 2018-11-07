import 'package:flutter/widgets.dart';

class LabelClipper extends CustomClipper<Path> {

  final double cutWidth;

  LabelClipper(this.cutWidth);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width-cutWidth, size.height/2);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}