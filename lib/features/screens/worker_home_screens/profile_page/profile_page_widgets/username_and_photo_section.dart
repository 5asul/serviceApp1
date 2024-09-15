import 'package:flutter/material.dart';

import '../../../../../config/theme/app_size.dart';

class UsernameAndPhotoSection extends StatelessWidget {
  final String name;
  final String id;
  const UsernameAndPhotoSection({
    super.key,
    required this.name,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppSize.height(context) * 0.02,
      child: Column(
        children: [
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: AppSize.width(context) * 0.35),
            child: CircleAvatar(
              foregroundImage: AssetImage('assets/cleaner.jpg'),
              radius: AppSize.width(context) * 0.15,
            ),
          ),
          Container(
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: AppSize.width(context) * 0.08,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  id,
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
