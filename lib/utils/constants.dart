import 'package:flutter/material.dart';

class Constants {
  static const emailErrorMsg = 'E-mail must be filled.';
  static const passwErrorMsg = 'Password must be filled.';

  static const double deviceListWidthFactor = 0.475;

  static EdgeInsets defaultPadding = const EdgeInsets.all(20);
  static EdgeInsets bodyPadding = const EdgeInsets.symmetric(horizontal: 25);

  static Shadow simpleShadow = const Shadow(
    color: Colors.black26,
    blurRadius: 5,
  );
  static Shadow elevationShadow = const Shadow(
    color: Colors.black26,
    blurRadius: 5,
    offset: Offset(0, 4),
  );

  static BoxShadow simpleBoxShadow = const BoxShadow(
    color: Colors.black26,
    blurRadius: 5,
  );
  static BoxShadow elevationBoxShadow = const BoxShadow(
    color: Colors.black26,
    blurRadius: 5,
    offset: Offset(0, 4),
  );
}
