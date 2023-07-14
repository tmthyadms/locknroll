import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/appbar.dart';
import '../components/navbar.dart';
import '../providers/layout_primary_provider.dart';
import 'account_view/account_view.dart';
import 'home_view/home_view.dart';
import 'settings_view/settings_view.dart';

class LayoutPrimaryView extends StatefulWidget {
  const LayoutPrimaryView({super.key});

  @override
  State<LayoutPrimaryView> createState() => _LayoutPrimaryViewState();
}

class _LayoutPrimaryViewState extends State<LayoutPrimaryView> {
  final _views = [
    const HomeView(),
    const AccountView(),
    const SettingsView(),
  ];

  Widget selectedView() =>
      _views[context.watch<LayoutPrimaryProvider>().currentIndex];

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
      bottomNavigationBar: const Navbar(),
    );
  }
}
