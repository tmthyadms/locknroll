import 'package:flutter/material.dart';

import '../../../components/circle_icon.dart';
import '../../../theme/utils/color_palette.dart';

class UserDetailsTile extends StatelessWidget {
  final IconData icon;
  // final String title;
  final String detail;

  const UserDetailsTile({
    super.key,
    required this.icon,
    // required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CircleIcon(icon: icon, size: 20),
      // title: Text(title, style: txtTheme.titleSmall),
      title: Text(detail,
          style: txtTheme.labelLarge!.copyWith(color: ColorPalette.darkShadow)),
    );
  }
}
