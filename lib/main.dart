import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/device_provider.dart';
import 'providers/layout_primary_provider.dart';
import 'providers/layout_secondary_provider.dart';
import 'providers/layout_tertiary_provider.dart';
import 'theme/custom_theme.dart';
import 'utils/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LayoutPrimaryProvider()),
      ChangeNotifierProvider(create: (context) => LayoutSecondaryProvider()),
      ChangeNotifierProvider(create: (context) => LayoutTertiaryProvider()),
      ChangeNotifierProvider(create: (context) => DeviceProvider()),
    ],
    child: const LockNRoll(),
  ));
}

class LockNRoll extends StatelessWidget {
  const LockNRoll({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LockNRoll',
      theme: CustomTheme(context: context).lightTheme(),
      initialRoute: '/',
      routes: routes,
    );
  }
}
