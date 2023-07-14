import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../services/main_service.dart';
import '../views/forgot_passw_view.dart';
import '../views/layout_primary_view.dart';
import '../views/layout_secondary_view.dart';
import '../views/layout_tertiary_view.dart';
import '../views/splash_view.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const SplashView(),
  '/main': (context) => const MainService(),
  '/auth': (context) => const AuthService(),
  '/forgotPassw': (context) => const ForgotPasswView(),
  '/layoutPrimary': (context) => const LayoutPrimaryView(),
  '/layoutSecondary': (context) => const LayoutSecondaryView(),
  '/layoutTertiary': (context) => const LayoutTertiaryView(),
};
