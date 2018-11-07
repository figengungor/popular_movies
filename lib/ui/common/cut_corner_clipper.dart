import 'package:flutter/widgets.dart';

class CutCornerClipper extends CustomClipper<Path> {

  final double cutSize;

  CutCornerClipper(this.cutSize);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, cutSize);
    path.lineTo(cutSize, 0.0);
    path.lineTo(size.width-cutSize, 0.0);
    path.lineTo(size.width, cutSize);
    path.lineTo(size.width, size.height-cutSize);
    path.lineTo(size.width-cutSize, size.height);
    path.lineTo(cutSize, size.height);
    path.lineTo(0.0, size.height-cutSize);
    path.lineTo(0.0, cutSize);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}