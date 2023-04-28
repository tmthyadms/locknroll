import 'package:flutter/material.dart';

class HGap extends StatelessWidget {
  final double gap;

  const HGap({
    super.key,
    this.gap = 10,
  });

  const HGap.medium({
    super.key,
    this.gap = 20,
  });

  const HGap.large({
    super.key,
    this.gap = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: gap);
  }
}
