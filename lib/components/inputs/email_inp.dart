import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class EmailInp extends StatelessWidget {
  final TextEditingController emailController;
  final String? hintText;

  const EmailInp({
    super.key,
    required this.emailController,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => value!.isEmpty || !EmailValidator.validate(value)
            ? Constants.emailErrorMsg
            : null,
        decoration: InputDecoration(hintText: hintText ?? 'johndoe@email.com'));
  }
}
