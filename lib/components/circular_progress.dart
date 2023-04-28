import 'package:flutter/material.dart';

import '../theme/utils/color_palette.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: ColorPalette.primary);
  }
}
