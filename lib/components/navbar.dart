import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../providers/layout_primary_provider.dart';
import '../theme/utils/color_palette.dart';
import '../utils/constants.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Constants.bodyPadding + const EdgeInsets.only(bottom: 35),
      decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: ColorPalette.background,
          shadows: [Constants.simpleBoxShadow]),
      child: GNav(
        onTabChange: (selectedIndex) {
          context.read<LayoutPrimaryProvider>().currentIndex = selectedIndex;
        },
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        padding: const EdgeInsets.all(20),
        gap: 10,
        tabs: const [
          GButton(icon: Icons.cottage_outlined, text: 'Home'),
          GButton(icon: Icons.account_circle_outlined, text: 'Account'),
          GButton(icon: Icons.settings_outlined, text: 'Settings'),
        ],
      ),
    );
  }
}
