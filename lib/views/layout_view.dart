import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/appbar.dart';
import '../components/navbar/current_index.dart';
import '../components/navbar/navbar.dart';
import 'account_view/account_view.dart';
import 'device_control_view.dart';
import 'home_view/home_view.dart';
import 'log_view/log_view.dart';
import 'settings_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  final _views = [
    const HomeView(),
    const AccountView(),
    const SettingsView(),
    const DeviceControlView(),
    const LogView()
  ];

  Widget selectedView() => _views[context.watch<CurrentIndex>().currentIndex];

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
