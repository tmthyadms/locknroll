import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomSnackbar extends StatelessWidget {
  final String msg;

  const CustomSnackbar({
    super.key,
    required this.msg,
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      duration: const Duration(milliseconds: 200),
      margin: Constants.bodyPadding + const EdgeInsets.only(bottom: 35),
      content: Text(msg, textAlign: TextAlign.center),
    );
  }
}
