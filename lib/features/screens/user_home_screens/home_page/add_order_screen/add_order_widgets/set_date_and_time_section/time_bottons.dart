import 'package:flutter/material.dart';

import '../../../../../../../config/theme/colors_theme.dart';

class TimeBottons extends StatelessWidget {
  const TimeBottons({
    Key? key,
    required this.timeName,
    required this.screenWidth,
  }) : super(key: key);

  final String timeName;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.018),
      child: Container(
          padding: EdgeInsets.all(3.0),
          decoration: BoxDecoration(
              color: ColorsTheme().primary.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10.0),
              border:
                  Border.all(color: ColorsTheme().primary.withOpacity(0.8))),
          child: Text(
            timeName,
            style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}