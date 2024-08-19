import 'package:flutter/material.dart';

import '../../../../../config/theme/colors_theme.dart';

class SignUpStrokText extends StatelessWidget {
  const SignUpStrokText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Text(
        'Sign Up',
        style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 7.0
              ..color = Colors.white54),
      ),
      Text(
        'Sign Up',
        style: TextStyle(
            shadows: [
              Shadow(
                blurRadius: 5.0,
                color: Colors.black,
                offset: Offset(1.0, 1.0),
              ),
            ],
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: ColorsTheme().primary),
      )
    ]);
  }
}
