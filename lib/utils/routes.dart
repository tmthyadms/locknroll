import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../services/main_service.dart';
import '../views/forgot_passw_view.dart';
import '../views/splash_view.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const SplashView(),
  '/main': (context) => const MainService(),
  '/auth': (context) => const AuthService(),
  '/forgotPassw': (context) => const ForgotPasswView(),
};
