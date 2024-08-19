import 'package:flutter/material.dart';

import '../../../../../config/theme/colors_theme.dart';

class LoginStrokText extends StatelessWidget {
  const LoginStrokText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Text(
        'Login',
        style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 7.0
              ..color = Colors.white54),
      ),
      Text(
        'Login',
        style: TextStyle(
            shadows: [
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 2.0,
                color: Colors.black,
              )
            ],
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: ColorsTheme().primary),
      )
    ]);
  }
}