import 'package:flutter/material.dart';

import '../../theme/utils/color_palette.dart';
import '../gaps/hgap.dart';

class CustomElevatedBtn extends StatelessWidget {
  final Function() onPressed;
  final double? height;
  final Color? color;
  final String name;
  final IconData icon;

  const CustomElevatedBtn({
    super.key,
    required this.onPressed,
    this.height = 48,
    this.color,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height!,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? ColorPalette.tertiary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name.toUpperCase()),
            const HGap(),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
