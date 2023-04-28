import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';
import '../views/layout_view.dart';

class MainService extends StatefulWidget {
  const MainService({super.key});

  @override
  State<MainService> createState() => _MainServiceState();
}

class _MainServiceState extends State<MainService> {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;

    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) =>
            snapshot.hasData ? const LayoutView() : const AuthService());
  }
}
