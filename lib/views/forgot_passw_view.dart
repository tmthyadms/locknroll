import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/appbar.dart';
import '../components/buttons/elevated_btn.dart';
import '../components/gaps/vgap.dart';
import '../components/inputs/validated_inp.dart';
import '../components/snackbar.dart';
import '../theme/utils/color_palette.dart';
import '../utils/constants.dart';

class ForgotPasswView extends StatefulWidget {
  const ForgotPasswView({super.key});

  @override
  State<ForgotPasswView> createState() => _ForgotPasswViewState();
}

class _ForgotPasswViewState extends State<ForgotPasswView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  Future resetPassw() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await auth.sendPasswordResetEmail(email: emailController.text.trim());
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackbar(msg: error.message.toString()) as SnackBar);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [const CustomSliverAppbar()],
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
            padding: Constants.bodyPadding,
            child: Column(
              children: [
                // Image
                Image.asset(
                  'images/forgot-passw.png',
                  width: 200,
                  height: 200,
                ),
                const VGap(),

                // Title
                Text('Forgot your password?', style: txtTheme.headlineMedium),
                const VGap(),

                // Description
                Text(
                    'Fret not, enter your email below and we\'ll send you a link.',
                    textAlign: TextAlign.center,
                    style: txtTheme.labelLarge!
                        .copyWith(color: ColorPalette.darkShadow)),
                const VGap.medium(),

                // Form
                Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email', style: txtTheme.titleSmall),
                        const VGap(),
                        ValidatedInp(
                            controller: emailController,
                            errorMsg: Constants.emailErrorMsg,
                            hintText: 'E-mail address'),
                        const VGap(),
                        CustomElevatedBtn(
                            onPressed: resetPassw,
                            name: 'Send link',
                            icon: Icons.link_rounded),
                      ],
                    ))
              ],
            ),
          )))),
    );
  }
}
