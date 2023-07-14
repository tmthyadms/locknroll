import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/appbar.dart';
import '../providers/layout_tertiary_provider.dart';
import 'log_view/log_view.dart';

class LayoutTertiaryView extends StatefulWidget {
  const LayoutTertiaryView({super.key});

  @override
  State<LayoutTertiaryView> createState() => _TertiaryLayoutState();
}

class _TertiaryLayoutState extends State<LayoutTertiaryView> {
  final _views = [
    const LogView(),
  ];

  Widget selectedView() =>
      _views[context.watch<LayoutTertiaryProvider>().currentIndex];

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
