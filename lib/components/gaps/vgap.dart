import 'package:flutter/material.dart';

class VGap extends StatelessWidget {
  final double gap;

  const VGap({
    super.key,
    this.gap = 10,
  });

  const VGap.medium({
    super.key,
    this.gap = 20,
  });

  const VGap.large({
    super.key,
    this.gap = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: gap);
  }
}
