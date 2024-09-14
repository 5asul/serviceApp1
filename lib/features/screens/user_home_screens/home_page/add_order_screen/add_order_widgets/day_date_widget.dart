import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';

import '../../../../../../config/theme/colors_theme.dart';
import '../../../../../state_managment/provider/add_order_provider.dart';

class DayDateWidget extends StatelessWidget {
  const DayDateWidget({
    super.key,
    required this.dayNumber,
    required this.onTap,
    required this.isSelected,
    required this.dayName,
  });
  final String dayName;
  final bool isSelected;
  final int dayNumber;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    bool isHovered = false;
    return Container(
      padding: EdgeInsets.only(
        left: AppSize.width(context) * 0.030,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: AppSize.height(context) * 0.005),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Text(
                  dayName,
                  style: TextStyle(
                    fontSize: AppSize.width(context) * 0.035,
                    fontWeight: FontWeight.bold,
                    color: ColorsTheme().primary.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: onTap,
            onHover: (hovering) {
              isHovered = hovering;
            },
            child: CircleAvatar(
              radius: AppSize.width(context) * 0.047,
              backgroundColor:
                  isSelected ? ColorsTheme().secondary : ColorsTheme().primary,
              child: Text(
                "$dayNumber",
                style: TextStyle(
                  fontSize: AppSize.width(context) * 0.035,
                  color: isSelected ? ColorsTheme().primary : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
