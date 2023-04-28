import 'package:flutter/material.dart';

import 'utils/color_palette.dart';

final snackbarThemeData = SnackBarThemeData(
  behavior: SnackBarBehavior.floating,
  shape: const StadiumBorder(),
  backgroundColor: ColorPalette.secondary,
  contentTextStyle: const TextStyle(color: Colors.white),
);
