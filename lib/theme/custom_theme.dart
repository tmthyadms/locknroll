import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'card_theme.dart';
import 'elevated_btn_theme.dart';
import 'inp_decor_theme.dart';
import 'snackbar_theme.dart';
import 'txt_btn_theme.dart';
import 'txt_theme.dart';
import 'utils/color_palette.dart';

class CustomTheme {
  final BuildContext context;

  CustomTheme({required this.context});

  ThemeData lightTheme() => ThemeData(
        useMaterial3: true,
        primaryColor: ColorPalette.primary,
        scaffoldBackgroundColor: ColorPalette.background,
        fontFamily: GoogleFonts.titilliumWeb().fontFamily,
        textTheme: txtTheme,
        inputDecorationTheme: inpDecorTheme(context: context),
        cardTheme: cardTheme,
        textButtonTheme: txtBtnThemeData,
        elevatedButtonTheme: elevatedBtnThemeData,
        snackBarTheme: snackbarThemeData,
      );
}
