import 'package:flutter/material.dart';

import '../../../../../../../config/theme/colors_theme.dart';

class WorkTypeAndLocationSection extends StatelessWidget {
  const WorkTypeAndLocationSection({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            
          height: screenSize.height * 0.04,
          margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.01),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenSize.width * 0.015),
            color: ColorsTheme().primary
            
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: screenSize.width*0.02,
                  right: screenSize.width*0.02),
              child: Text(
                "Teacher",
                style: TextStyle(
                  fontSize: screenSize.width * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: screenSize.width*0.02,
                right: screenSize.width*0.015),
                child: Icon(
                  Icons.location_pin,
                  size: screenSize.width * 0.07,
                  color: ColorsTheme().primary,
                ),
              ),
              Container(
                width: screenSize.width*0.3,
                child: Text(
                    "679 Eagle Crest Alley",
                  overflow:TextOverflow.ellipsis ,
                  style: TextStyle(
                    fontSize: screenSize.width * 0.035,
                    color: Colors.grey.shade600,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}