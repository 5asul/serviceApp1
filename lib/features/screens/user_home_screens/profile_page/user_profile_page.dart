import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';

import 'profile_page_widgets/costom_user_profile_tile.dart';
import 'profile_page_widgets/user_profile_container.dart';
import 'profile_page_widgets/username_and_photo_section.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme().primary,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              UserProfileContainer(),
              UsernameAndPhotoSection(),
            ],
          ),
        ),
      ),
    );
  }
}




