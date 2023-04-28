import 'package:flutter/material.dart';

import 'template_circle_btn.dart';

class IconCircleBtn extends StatelessWidget {
  final Function() onPressed;
  final double? size;
  final Color? bgColor;
  final IconData icon;
  final double? iconSize;
  final Color? fgColor;

  const IconCircleBtn({
    super.key,
    required this.onPressed,
    this.size = 48,
    this.bgColor,
    required this.icon,
    this.iconSize,
    this.fgColor,
  });

  @override
  Widget build(BuildContext context) {
    return TemplateCircleBtn(
      onPressed: onPressed,
      size: size,
      bgColor: bgColor,
      child: Icon(icon, size: iconSize ?? size! * 0.5, color: fgColor),
    );
  }
}
