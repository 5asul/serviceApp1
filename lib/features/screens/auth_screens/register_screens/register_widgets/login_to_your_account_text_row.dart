import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_for_all/features/screens/auth_screens/login_screen/login_screen.dart';

import '../../../../../config/theme/colors_theme.dart';

class LoginToYourAccountRow extends StatelessWidget {
  const LoginToYourAccountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Login to your account',
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(PageTransition(
                  child: LoginScreen(),
                  type: PageTransitionType.rightToLeft));
            },
            child: Stack(
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3.5
                        ..color = Colors.white54),
                ),
                Text(
                  'Login',
                  style: TextStyle(color: ColorsTheme().primary),
                ),
              ],
            ))
      ],
    );
  }
}