import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../config/theme/colors_theme.dart';

class LoginBotton extends StatelessWidget {
  const LoginBotton({
    super.key,
    required this.email,
    required this.password,
  });

  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorsTheme().primary,
      child: MaterialButton(
        onPressed: () async {
          try {
            final credential = await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: email.text, password: password.text);
            Navigator.of(context).pushNamedAndRemoveUntil(
                'container', (root) => false);
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      title: "Error",
                      desc: "No user found for that email.")
                  .show();
              print('No user found for that email.');
            } else if (e.code == 'wrong-password') {
              AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      title: "Error",
                      desc: "Wrong password provided for that user."
                      )
                  .show();
              print('Wrong password provided for that user.');
            }
          }
        },
        child: Text(
          'LOGIN',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}