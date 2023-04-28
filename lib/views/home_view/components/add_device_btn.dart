import 'package:flutter/material.dart';

import '../../../components/circle_icon.dart';
import '../../../components/gaps/vgap.dart';
import '../../../theme/utils/color_palette.dart';
import '../../../utils/constants.dart';

class AddDeviceBtn extends StatelessWidget {
  const AddDeviceBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: Constants.deviceListWidthFactor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Material(
            child: InkWell(
              onTap: () {},
              child: Ink(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: ColorPalette.shadow)),
                    color: ColorPalette.background),
                child: Container(
                  height: 160,
                  padding: Constants.defaultPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleIcon(padding: 0, icon: Icons.add_rounded),
                      const VGap(),
                      Text('Add device',
                          style: Theme.of(context).textTheme.titleSmall)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
