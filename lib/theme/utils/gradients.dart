import 'package:flutter/material.dart';
import 'color_palette.dart';

class Gradients {
  static LinearGradient hPrimary =
      LinearGradient(colors: ColorPalette.primaryGradientColors);
  static LinearGradient hDarkPrimary =
      LinearGradient(colors: ColorPalette.darkPrimaryGradientColors);

  static LinearGradient vPrimary = LinearGradient(
    colors: ColorPalette.primaryGradientColors,
    begin: Alignment.topRight,
    end: Alignment.bottomRight,
  );
  static LinearGradient vDarkPrimary = LinearGradient(
    colors: ColorPalette.darkPrimaryGradientColors,
    begin: Alignment.topRight,
    end: Alignment.bottomRight,
  );
}
