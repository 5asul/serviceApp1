import 'package:flutter/material.dart';

import '../../../../../config/theme/app_size.dart';

class UsernameAndPhotoSection extends StatelessWidget {
  const UsernameAndPhotoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppSize.height(context) * 0.02,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppSize.width(context) * 0.35),
            child: CircleAvatar(
              foregroundImage: AssetImage('assets/cleaner.jpg'),
              radius: AppSize.width(context) * 0.15,
            ),
          ),
          Container(
            child: Column(
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(
                      fontSize: AppSize.width(context) * 0.08,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'ID:035092372',
                  style: TextStyle(
                      fontSize: AppSize.width(context) * 0.04,
                      color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}