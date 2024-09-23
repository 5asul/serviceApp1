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
          // Image.network(src),
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: AppSize.width(context) * 0.35),
            child: CircleAvatar(
              foregroundImage: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/home-service-app-34655.appspot.com/o/upload%2F1000317496.jpg?alt=media&token=1d794ad4-3c72-4bdf-9e0b-f0f902be90cd'),
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
