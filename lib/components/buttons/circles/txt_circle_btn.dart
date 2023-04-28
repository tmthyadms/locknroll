import 'package:flutter/material.dart';

import 'template_circle_btn.dart';

class TxtCircleBtn extends StatelessWidget {
  final Function() onPressed;
  final double? size;
  final Color? bgColor;
  final String name;
  final double? nameSize;

  const TxtCircleBtn({
    super.key,
    required this.onPressed,
    this.size,
    this.bgColor,
    required this.name,
    this.nameSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return TemplateCircleBtn(
      onPressed: onPressed,
      size: size,
      bgColor: bgColor,
      child: Text(
        name.toUpperCase(),
        style: TextStyle(
            fontSize: nameSize,
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    );
  }
}
