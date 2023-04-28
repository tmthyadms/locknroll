import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ColorPalette {
  static Color primary = HexColor('#344e41');
  static Color darkPrimary = HexColor('#588157');
  static Color secondary = HexColor('#a3b18a');
  static Color tertiary = HexColor('#4c956c');

  static Color background = HexColor('#edf6f9');
  static Color shadow = HexColor('#d9d9d9');
  static Color darkShadow = HexColor('#adb5bd');
  static Color error = HexColor('#e63946');
  static Color darkError = HexColor('#b23a48');
  static Color lightError = HexColor('#f5cac3');

  static List<Color> primaryGradientColors = [primary, darkPrimary];
  static List<Color> darkPrimaryGradientColors = [darkPrimary, primary];
}
