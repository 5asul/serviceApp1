import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../config/theme/colors_theme.dart';

import '../../register_screens/sign_up_screen.dart';

class DontHaveAnAccountRow extends StatelessWidget {
  const DontHaveAnAccountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Dont\'t have an account',
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(PageTransition(
                  child: SignUpScreen(),
                  type: PageTransitionType.leftToRight));
            },
            child: Stack(
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3.5
                        ..color = Colors.white54),
                ),
                Text(
                  'Register',
                  style: TextStyle(color: ColorsTheme.primary),
                ),
              ],
            ))
      ],
    );
  }
}