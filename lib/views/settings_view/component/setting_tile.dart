import 'package:flutter/material.dart';

import '../../../components/circle_icon.dart';
import '../../../theme/utils/color_palette.dart';
import '../../../utils/constants.dart';

class SettingTile extends StatelessWidget {
  final String title;

  const SettingTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: Constants.defaultCircularRadius,
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Ink(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: Constants.defaultCircularRadius,
                    side: Constants.simpleBorder),
                color: ColorPalette.background,
              ),
              child: ListTile(
                title: Text(title),
                trailing: const CircleIcon(
                    icon: Icons.chevron_right_rounded, padding: 0),
              )),
        ),
      ),
    );
  }
}
