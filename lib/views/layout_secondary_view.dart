import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/appbar.dart';
import '../providers/layout_secondary_provider.dart';
import 'device_control_view.dart';

class LayoutSecondaryView extends StatefulWidget {
  const LayoutSecondaryView({super.key});

  @override
  State<LayoutSecondaryView> createState() => _LayoutSecondaryViewState();
}

class _LayoutSecondaryViewState extends State<LayoutSecondaryView> {
  final _views = [
    const DeviceControlView(),
  ];

  Widget selectedView() =>
      _views[context.watch<LayoutSecondaryProvider>().currentIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [const CustomSliverAppbar()],
          body: SafeArea(
              child: SingleChildScrollView(
            child: selectedView(),
          ))),
    );
  }
}
