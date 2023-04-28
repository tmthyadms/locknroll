import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/buttons/circles/txt_circle_btn.dart';
import '../components/gaps/hgap.dart';
import '../components/gaps/vgap.dart';
import '../components/header/header.dart';
import '../components/inputs/validated_inp.dart';
import '../components/snackbar.dart';
import '../utils/constants.dart';

class SigninView extends StatefulWidget {
  final VoidCallback onToggleToSignupView;

  const SigninView({
    super.key,
    required this.onToggleToSignupView,
  });

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  Future<void> signin() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwController.text.trim());
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackbar(msg: error.message.toString()) as SnackBar);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          // Header
          const Header(),

          // Form
          Form(
              key: _formKey,
              child: Padding(
                  padding: Constants.bodyPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header padding
                      const VGap.large(),

                      // Greetings
                      Text('Hey there!\nGlad to see you again.',
                          style: txtTheme.headlineSmall),
                      const VGap.medium(),

                      // Text form fields
                      // 1. E-mail
                      Text('E-mail', style: txtTheme.titleSmall),
                      const VGap(),
                      ValidatedInp(
                          controller: _emailController,
                          errorMsg: Constants.emailErrorMsg,
                          hintText: 'E-mail address'),
                      const VGap.medium(),

                      // 2. Password
                      Text('Password', style: txtTheme.titleSmall),
                      const VGap(),
                      ValidatedInp(
                          controller: _passwController,
                          isObscure: true,
                          errorMsg: Constants.passwErrorMsg,
                          hintText: 'Password'),

                      // Forgot password
                      Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/forgotPassw'),
                              child: const Text('Forgot your password?'))),
                      const VGap.large(),

                      // Sign up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('New here? Join us now!',
                                  style: txtTheme.bodyMedium),
                              GestureDetector(
                                  onTap: widget.onToggleToSignupView,
                                  child: Row(
                                    children: [
                                      Text('sign up'.toUpperCase(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600)),
                                      const HGap(),
                                      const Icon(Icons.chevron_right_rounded)
                                    ],
                                  ))
                            ],
                          ),
                          // Sign in button
                          TxtCircleBtn(
                              onPressed: signin, size: 65, name: 'next')
                        ],
                      ),
                      // Bottom padding
                      const VGap.large()
                    ],
                  ))),
        ],
      ),
    )));
  }
}
