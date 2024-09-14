import 'package:flutter/material.dart';

import '../../../../../../../config/theme/app_size.dart';
import '../../../../../../../config/theme/colors_theme.dart';

class TimeBottons extends StatelessWidget {
  const TimeBottons({
    Key? key,
    required this.timeName,
    required this.screenWidth, 
    required this.isSelected,
     required this.onTap,
  }) : super(key: key);

  final String timeName;
  final double screenWidth;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    bool isHovered = false;
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.018),
      child: InkWell(
        onTap: onTap,
            onHover: (hovering){
          isHovered = hovering;
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppSize.width(context)*0.006,
            vertical: AppSize.height(context)*0.005),
            decoration: BoxDecoration(
                color:isSelected ? ColorsTheme().secondary : ColorsTheme().primary,
                borderRadius: BorderRadius.circular(10.0),
                border:
                    Border.all(color: ColorsTheme().primary.withOpacity(0.8))),
            child: Text(
              timeName,
              style: TextStyle(
                  color:isSelected ? ColorsTheme().primary : Colors.white,
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}