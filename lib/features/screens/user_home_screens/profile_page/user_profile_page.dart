import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_user_provider.dart';
import 'package:provider/provider.dart';

import '../user_home_screens_widgets/home_screens_appBar.dart';
import 'profile_page_widgets/user_profile_container.dart';
import 'profile_page_widgets/username_and_photo_section.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    final userProvider =
        Provider.of<FirebaseUserProvider>(context, listen: false);
    userProvider.getUsersStreamById(user!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(
        context,
      ),
      backgroundColor: ColorsTheme().primary,
      body: Stack(
        children: [
          UserProfileContainer(),
          Consumer<FirebaseUserProvider>(
            builder: (context, firebaseUserProvider, _) {
              final user = firebaseUserProvider.users[0];
              return UsernameAndPhotoSection(
                image: user.profilePic ?? 'Unknown',
                name: user.username ?? 'Unknown',
                id: user.firebaseUid ?? 'Unknown',
              );
            },
          ),
        ],
      ),
    );
  }
}
