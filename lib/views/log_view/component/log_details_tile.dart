import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../components/circle_icon.dart';
import '../../../theme/utils/color_palette.dart';

class LogDetailsTile extends StatelessWidget {
  final IconData icon;
  final String subject;
  final String status;
  final Color? statusColor;
  final DateTime date;

  const LogDetailsTile({
    super.key,
    required this.icon,
    required this.subject,
    required this.status,
    this.statusColor = Colors.black,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CircleIcon(icon: icon, size: 20),
      title: Row(
        children: [
          Text(subject,
              style: txtTheme.bodyMedium!.copyWith(
                  fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                  fontWeight: FontWeight.w600)),
          Text(' was ', style: txtTheme.bodyMedium),
          Text(status,
              style: txtTheme.bodyMedium!.copyWith(
                  fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                  fontWeight: FontWeight.w600,
                  color: statusColor)),
        ],
      ),
      trailing: Text(DateFormat.jm().format(date),
          style: txtTheme.labelLarge!.copyWith(color: ColorPalette.darkShadow)),
    );
  }
}
