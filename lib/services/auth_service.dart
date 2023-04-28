import 'package:flutter/material.dart';

import '../views/signin_view.dart';
import '../views/signup_view.dart';

class AuthService extends StatefulWidget {
  const AuthService({super.key});

  @override
  State<AuthService> createState() => _AuthServiceState();
}

class _AuthServiceState extends State<AuthService> {
  bool _isDisplayingSignin = true;

  void toggleView() =>
      setState(() => _isDisplayingSignin = !_isDisplayingSignin);

  @override
  Widget build(BuildContext context) {
    return _isDisplayingSignin
        ? SigninView(onToggleToSignupView: toggleView)
        : SignupView(onToggleToSigninView: toggleView);
  }
}
