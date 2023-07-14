import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import '../../../components/circle_icon.dart';
import '../../../providers/device_provider.dart';
import '../../../providers/layout_secondary_provider.dart';
import '../../../theme/utils/color_palette.dart';
import '../../../utils/constants.dart';

class DeviceBtn extends StatefulWidget {
  final bool wasEnabled;
  final bool wasLocked;
  final String name;
  final String deviceID;

  const DeviceBtn({
    super.key,
    required this.wasEnabled,
    required this.wasLocked,
    required this.name,
    required this.deviceID,
  });

  @override
  State<DeviceBtn> createState() => _DeviceBtnState();
}

class _DeviceBtnState extends State<DeviceBtn> {
  bool? isEnabled;

  @override
  void initState() {
    isEnabled = widget.wasEnabled;
    super.initState();
  }

  void toggleStatus(bool value) => setState(() => isEnabled = value);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: Constants.deviceListWidthFactor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Material(
          child: InkWell(
            onTap: () {
              context.read<DeviceProvider>().currentDeviceID = widget.deviceID;
              context.read<LayoutSecondaryProvider>().currentIndex = 0;
              Navigator.pushNamed(context, '/layoutSecondary');
            },
            child: Ink(
                color: ColorPalette.secondary,
                child: Container(
                  height: 200,
                  padding: Constants.defaultPadding,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleIcon(
                                bgColor: ColorPalette.shadow.withOpacity(0.5),
                                icon: widget.wasLocked
                                    ? Icons.vpn_key_outlined
                                    : Icons.vpn_key_off_outlined,
                                size: 20,
                                fgColor: Colors.white),
                            Text(isEnabled! ? 'On' : 'Off',
                                style: const TextStyle(color: Colors.white))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: Colors.white)),
                            SizedBox(
                              width: 48,
                              height: 24,
                              child: FlutterSwitch(
                                onToggle: (value) => toggleStatus(value),
                                value: isEnabled!,
                                toggleSize: 24,
                                toggleColor: Colors.white,
                                activeColor:
                                    ColorPalette.shadow.withOpacity(0.5),
                                inactiveColor:
                                    ColorPalette.shadow.withOpacity(0.5),
                              ),
                            )
                          ],
                        )
                      ]),
                )),
          ),
        ),
      ),
    );
  }
}
