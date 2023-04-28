import 'package:flutter/material.dart';

import '../../../theme/utils/color_palette.dart';

class TemplateCircleBtn extends StatelessWidget {
  final Function() onPressed;
  final double? size;
  final Color? bgColor;
  final Widget child;

  const TemplateCircleBtn({
    super.key,
    required this.onPressed,
    this.size = 48, // 36
    this.bgColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      minWidth: size,
      height: size,
      color: bgColor ?? ColorPalette.tertiary,
      child: child,
    );
  }
}
