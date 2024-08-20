import 'package:flutter/material.dart';

import '../../../../../config/theme/app_size.dart';
import '../../../../../config/theme/colors_theme.dart';
import 'costom_user_profile_tile.dart';

class UserProfileContainer extends StatelessWidget {
  const UserProfileContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.width(context) * 0.1,
          vertical: AppSize.height(context) * 0.05),
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: AppSize.height(context) * 0.1),
      width: AppSize.width(context) * 1.0,
      height: AppSize.height(context) * 1.0,
      decoration: BoxDecoration(
          color: ColorsTheme().white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.width(context) * 0.15),
              topRight: Radius.circular(AppSize.width(context) * 0.15))),
      child: Container(
        margin: EdgeInsets.only(
          top: AppSize.height(context) * 0.17,
        ),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return CostomUserProfileTile(
              icon: Icons.person,
              title: 'Edit Profile',
            );
          },
        ),
      ),
    );
  }
}
