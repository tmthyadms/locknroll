import 'package:flutter/material.dart';

import '../utils/constants.dart';

class Logo extends StatelessWidget {
  final double? size;
  final Color? color;
  final bool? hasShadow;

  const Logo({
    super.key,
    this.size = 24,
    this.color = Colors.white,
    this.hasShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.camera_indoor_rounded,
      size: size,
      color: color,
      shadows: [hasShadow! ? Constants.simpleShadow : const Shadow()],
    );
  }
}
