import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../config/theme/colors_theme.dart';

class LoginBotton extends StatelessWidget {
  const LoginBotton({
    super.key,
    @required this.onPressed,
    required this.text,
    @required this.routeName,
  });

  final void Function()? onPressed;
  final String text;
  final String? routeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorsTheme().primary,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
