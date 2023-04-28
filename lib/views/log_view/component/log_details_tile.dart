import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../components/circle_icon.dart';
import '../../../theme/utils/color_palette.dart';

class LogDetailsTile extends StatelessWidget {
  final IconData icon;
  final String description;
  final DateTime date;

  const LogDetailsTile({
    super.key,
    required this.icon,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CircleIcon(icon: icon, size: 20),
      title: Text(description, style: txtTheme.bodyMedium),
      trailing: Text(DateFormat.jm().format(date),
          style: txtTheme.labelLarge!.copyWith(color: ColorPalette.darkShadow)),
    );
  }
}
