import 'dart:async';

import 'package:flutter/material.dart';

import '../components/logo.dart';
import '../components/gaps/vgap.dart';
import '../theme/utils/color_palette.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/main'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.primary,
        body: SafeArea(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            const Logo(size: 96),
            const VGap.medium(),

            // Title
            Text('LockNRoll',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: Colors.white)),
            const VGap(),

            // Slogan
            const Text('Your Personal Locksmith',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white))
          ],
        ))));
  }
}
