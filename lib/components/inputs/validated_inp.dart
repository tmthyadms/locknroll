import 'package:flutter/material.dart';

import '../../theme/utils/color_palette.dart';

class ValidatedInp extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool isObscure;
  final String errorMsg;
  final String hintText;

  const ValidatedInp({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isObscure = false,
    required this.errorMsg,
    required this.hintText,
  });

  @override
  State<ValidatedInp> createState() => _ValidatedInpState();
}

class _ValidatedInpState extends State<ValidatedInp> {
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
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.isObscure ? _obscure : false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => value!.isEmpty ? widget.errorMsg : null,
      decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: widget.isObscure ? visibilityBtn() : null),
    );
  }
}
