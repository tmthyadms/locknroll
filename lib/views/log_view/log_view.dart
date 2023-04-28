import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../components/gaps/vgap.dart';
import '../../theme/utils/color_palette.dart';
import '../../utils/constants.dart';
import 'component/log_details_tile.dart';

class LogView extends StatefulWidget {
  const LogView({super.key});

  @override
  State<LogView> createState() => _LogViewState();
}

class _LogViewState extends State<LogView> {
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Padding(
        padding: Constants.bodyPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title log
            Text('Main entrance', style: txtTheme.headlineMedium),
            Text('Log',
                style: txtTheme.headlineMedium!.copyWith(
                    fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                    fontWeight: FontWeight.w400)),
            const VGap.large(),

            // Current date
            Text(DateFormat.MMMMEEEEd().format(DateTime.now()),
                style: txtTheme.headlineSmall),
            const VGap.medium(),

            // Logs
            Card(
                color: ColorPalette.background,
                elevation: 4,
                child: Padding(
                  padding: Constants.defaultPadding,
                  child: Column(
                    children: [
                      LogDetailsTile(
                          icon: Icons.vpn_key_outlined,
                          description: 'Door was Unlocked',
                          date: DateTime.now()),
                      LogDetailsTile(
                          icon: Icons.doorbell_outlined,
                          description: 'Door was Knocked',
                          date: DateTime.now()),
                      LogDetailsTile(
                          icon: Icons.vpn_key_outlined,
                          description: 'Door was Locked',
                          date: DateTime.now()),
                      LogDetailsTile(
                          icon: Icons.photo_camera_outlined,
                          description: 'Image was Captured',
                          date: DateTime.now()),
                      LogDetailsTile(
                          icon: Icons.warning_outlined,
                          description: 'Alarm was Activated',
                          date: DateTime.now()),
                      LogDetailsTile(
                          icon: Icons.warning_outlined,
                          description: 'Alarm was Deactivated',
                          date: DateTime.now()),
                      LogDetailsTile(
                          icon: Icons.power_settings_new_outlined,
                          description: 'Door was Disabled',
                          date: DateTime.now()),
                      LogDetailsTile(
                          icon: Icons.power_settings_new_outlined,
                          description: 'Door was Enabled',
                          date: DateTime.now()),
                    ],
                  ),
                )),
            const VGap.large()
          ],
        ));
  }
}
