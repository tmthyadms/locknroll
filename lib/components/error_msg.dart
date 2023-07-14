import 'package:flutter/material.dart';

import '../theme/utils/color_palette.dart';
import '../utils/constants.dart';

class ErrorMsg extends StatelessWidget {
  final String msg;

  const ErrorMsg({
    super.key,
    required this.msg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.defaultPadding,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
            borderRadius: Constants.defaultCircularRadius),
        color: ColorPalette.darkError,
      ),
      child: Text(msg, textAlign: TextAlign.center),
    );
  }
}
