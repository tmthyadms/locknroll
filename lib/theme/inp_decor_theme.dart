import 'package:flutter/material.dart';

import 'utils/color_palette.dart';

InputDecorationTheme inpDecorTheme({required BuildContext context}) =>
    InputDecorationTheme(
        isDense: true,
        enabledBorder: outlineInpBorder(),
        focusedBorder: outlineInpBorder(),
        errorBorder: outlineInpBorder(color: ColorPalette.darkError),
        focusedErrorBorder: outlineInpBorder(color: ColorPalette.darkError),
        filled: true,
        fillColor: Colors.white,
        hintStyle: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: ColorPalette.shadow));

OutlineInputBorder outlineInpBorder({Color? color}) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(999),
      borderSide: BorderSide(color: color ?? ColorPalette.shadow),
    );
