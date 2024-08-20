import 'package:flutter/material.dart';

import '../../../../../../../config/theme/colors_theme.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.02,),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'About me',
              style: TextStyle(
                fontSize: screenSize.width * 0.06,
                fontWeight: FontWeight.bold,
                color: ColorsTheme().primary,
              ),
            ),
          ),
          Container(
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                  'sed do eiusmod tempor incididunt ut labore et dolore magna '
                  'aliqua. Ut enim ad minim veniam, quis nostrud exercitation'
                  ' ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                  'Duis aute irure dolor in reprehenderit in voluptate velit '
                  'esse cillum dolore eu fugiat nulla pariatur. Excepteur sint'
                  ' occaecat cupidatat non proident, sunt in culpa qui officia '
                  'deserunt mollit anim id est laborum.',
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                color: Colors.grey.shade700
              ),
            ),
          )
        ],
      ),
    );
  }
}