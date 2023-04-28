import 'package:flutter/material.dart';

class SecondaryClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();

    path.lineTo(0, h);
    path.quadraticBezierTo(w * 0.25, h, w * 0.5, h * 0.5);
    path.quadraticBezierTo(w * 0.75, h * 0.85, w, h * 0.95);
    path.lineTo(w, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
