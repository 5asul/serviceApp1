import 'package:flutter/material.dart';

import '../../../../../config/theme/colors_theme.dart';

class EmailAuthStrokText extends StatelessWidget {
  const EmailAuthStrokText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Text(
        'Email Auth',
        style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 7.0
              ..color = Colors.white54),
      ),
      Text(
        'Email Auth',
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
