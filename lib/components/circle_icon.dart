import 'package:flutter/material.dart';

import '../theme/utils/color_palette.dart';

class CircleIcon extends StatelessWidget {
  final double? padding;
  final Color? bgColor;
  final IconData icon;
  final double? size;
  final Color? fgColor;

  const CircleIcon({
    super.key,
    this.padding = 8,
    this.bgColor,
    required this.icon,
    this.size = 24,
    this.fgColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding!),
      decoration: ShapeDecoration(
          shape: const CircleBorder(), color: bgColor ?? ColorPalette.shadow),
      child: Icon(icon, size: size, color: fgColor!),
    );
  }
}
