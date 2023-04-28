import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/buttons/circles/txt_circle_btn.dart';
import '../components/gaps/hgap.dart';
import '../components/gaps/vgap.dart';
import '../components/header/header.dart';
import '../components/inputs/email_inp.dart';
import '../components/inputs/passw_inp.dart';
import '../components/inputs/validated_inp.dart';
import '../components/snackbar.dart';
import '../models/user_model.dart';
import '../utils/constants.dart';

class SignupView extends StatefulWidget {
  final VoidCallback onToggleToSigninView;

  const SignupView({
    super.key,
    required this.onToggleToSigninView,
  });

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  Future<void> signup() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    final fullName = _fullNameController.text.trim();
    final nameParts = fullName.split(" ");
    final firstName = nameParts[0];
    final lastName = nameParts[nameParts.length - 1];
    final email = _emailController.text.trim();
    final passw = _passwController.text.trim();
    final dateRegistered = DateTime.now();

    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: passw)
          .then((value) async {
        final newUid = value.user!.uid;
        final newUser = UserModel(
            fullName: fullName,
            firstName: firstName,
            lastName: lastName,
            email: email,
            dateRegistered: dateRegistered);

        await _db.collection('users').doc(newUid).set(newUser.toMap());
      });
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackbar(msg: error.message.toString()) as SnackBar);
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
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
        const Header(),
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
                  Text('Let\'s get to know you better!',
                      style: txtTheme.headlineSmall),
                  const VGap.medium(),

                  // Text form fields
                  // 1. Full name
                  Text('What\'s should we call you?',
                      style: txtTheme.titleSmall),
                  const VGap(),
                  ValidatedInp(
                      controller: _fullNameController,
                      errorMsg: 'Full name must be filled.',
                      hintText: 'John Doe'),
                  const VGap.medium(),

                  // 2. Email
                  Text('What\'s your email?', style: txtTheme.titleSmall),
                  const VGap(),
                  EmailInp(emailController: _emailController),
                  const VGap.medium(),

                  // 3. Password
                  Text('What\'s your password?', style: txtTheme.titleSmall),
                  const VGap(),
                  PasswInp(passwController: _passwController),
                  const VGap.large(),

                  // Sign in
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Joined before? You know the drill.',
                              style: txtTheme.bodyMedium),
                          GestureDetector(
                              onTap: widget.onToggleToSigninView,
                              child: Row(
                                children: [
                                  Text('sign in'.toUpperCase(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  const HGap(),
                                  const Icon(Icons.chevron_right_rounded)
                                ],
                              ))
                        ],
                      ),
                      TxtCircleBtn(onPressed: signup, size: 65, name: 'next')
                    ],
                  ),
                  const VGap.large()
                ],
              )),
        )
      ],
    ))));
  }
}
