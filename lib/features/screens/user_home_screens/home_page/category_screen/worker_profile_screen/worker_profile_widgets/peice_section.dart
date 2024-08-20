import 'package:flutter/material.dart';

import '../../../../../../../config/theme/colors_theme.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.02,
            vertical: screenSize.height*0.02),
            child: Text(
              "\$27",
              style: TextStyle(
                fontSize: screenSize.width * 0.08,
                fontWeight: FontWeight.bold,
                color: ColorsTheme().primary,
              ),
            ),
          ),
          Container(
            child: Text(
              '(Floor price)',
              style: TextStyle(
                fontSize: screenSize.width * 0.05,
                color: Colors.grey.shade600,
              ),
            ),
          )
        ],
      ),
    );
  }
}