import 'package:flutter/material.dart';

import '../../theme/utils/color_palette.dart';
import '../../theme/utils/gradients.dart';
import '../gaps/hgap.dart';
import '../gaps/vgap.dart';
import '../logo.dart';
import 'components/primary_clip.dart';
import 'components/secondary_clip.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        secondaryWave(height: 250),
        primaryWave(height: 250),
        Positioned(
            top: 70,
            child: Column(
              children: [
                Row(
                  children: [
                    const Logo(size: 48),
                    const HGap(),
                    Text('LockNRoll',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: Colors.white))
                  ],
                ),
                const VGap(),
                const Text('Your Personal Locksmith',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ))
              ],
            ))
      ],
    );
  }

  ClipPath primaryWave({required double height}) => ClipPath(
        clipper: PrimaryClip(),
        child: Container(
          height: height,
          decoration: BoxDecoration(gradient: Gradients.vPrimary),
        ),
      );

  ClipPath secondaryWave({required double height}) => ClipPath(
        clipper: SecondaryClip(),
        child: Container(
          height: height,
          decoration: BoxDecoration(color: ColorPalette.secondary),
        ),
      );
}
