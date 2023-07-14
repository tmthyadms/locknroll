import 'package:flutter/material.dart';

import '../../components/gaps/vgap.dart';
import '../../utils/constants.dart';
import 'component/setting_tile.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Padding(
        padding: Constants.bodyPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account
            Text('Account', style: txtTheme.headlineMedium),
            const VGap(),
            const SettingTile(title: 'Account Preferences'),
            const VGap(),
            const SettingTile(title: 'Delete Account'),
            const VGap.medium(),

            // Notifications
            Text('Notifications', style: txtTheme.headlineMedium),
            const VGap(),
            const SettingTile(title: 'Activity'),
            const VGap(),
            const SettingTile(title: 'Updates'),
            const VGap.medium(),

            // Safety & Privacy
            Text('Safety & Privacy', style: txtTheme.headlineMedium),
            const VGap(),
            const SettingTile(title: 'Advanced Security'),
            const VGap.large(),
          ],
        ));
  }
}
