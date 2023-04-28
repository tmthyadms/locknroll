import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/buttons/circles/icon_circle_btn.dart';
import '../components/gaps/vgap.dart';
import '../components/navbar/current_index.dart';
import '../theme/utils/color_palette.dart';
import '../utils/constants.dart';

class DeviceControlView extends StatefulWidget {
  const DeviceControlView({super.key});

  @override
  State<DeviceControlView> createState() => _DeviceControlViewState();
}

class _DeviceControlViewState extends State<DeviceControlView> {
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Padding(
      padding: Constants.bodyPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Align(
              child: Image.asset('images/3d-smart-door-2.png',
                  width: 300, height: 300)),
          const VGap(),

          // Title & minor buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Main entrance', style: txtTheme.headlineMedium),
                  Text('Status',
                      style: txtTheme.headlineMedium!.copyWith(
                          fontFamily: GoogleFonts.titilliumWeb().fontFamily,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              Row(
                children: [
                  IconCircleBtn(
                      onPressed: () =>
                          context.read<CurrentIndex>().currentIndex = 4,
                      bgColor: ColorPalette.background,
                      icon: Icons.assignment_rounded),
                  IconCircleBtn(
                      onPressed: () {},
                      bgColor: ColorPalette.background,
                      icon: Icons.power_settings_new_rounded),
                ],
              )
            ],
          ),
          const VGap.large(),

          // Main buttons
          Card(
            color: ColorPalette.background,
            elevation: 4,
            child: Padding(
              padding: Constants.defaultPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconCircleBtn(
                      onPressed: () {},
                      bgColor: ColorPalette.shadow,
                      icon: Icons.photo_camera_rounded),
                  IconCircleBtn(
                      onPressed: () {},
                      size: 96,
                      icon: Icons.vpn_key_rounded,
                      fgColor: Colors.white),
                  IconCircleBtn(
                      onPressed: () {},
                      bgColor: ColorPalette.shadow,
                      icon: Icons.warning_rounded,
                      fgColor: ColorPalette.darkError)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
