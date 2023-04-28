import 'package:flutter/material.dart';

import '../../theme/utils/color_palette.dart';
import '../../utils/constants.dart';

class PasswInp extends StatefulWidget {
  final TextEditingController passwController;
  final String? hintText;

  const PasswInp({
    super.key,
    required this.passwController,
    this.hintText,
  });

  @override
  State<PasswInp> createState() => _PasswInpState();
}

class _PasswInpState extends State<PasswInp> {
  bool _obscure = true;

  void toggleObscure() => setState(() => _obscure = !_obscure);

  IconButton visibilityBtn() => IconButton(
      onPressed: toggleObscure,
      icon: Icon(
        _obscure ? Icons.visibility_off_rounded : Icons.visibility_off_rounded,
        size: 24,
        color: ColorPalette.shadow,
      ));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          value!.isEmpty || value.length < 7 ? Constants.passwErrorMsg : null,
      decoration: InputDecoration(
          hintText: widget.hintText ?? 'Min. 8 characters',
          suffixIcon: visibilityBtn()),
    );
  }
}
