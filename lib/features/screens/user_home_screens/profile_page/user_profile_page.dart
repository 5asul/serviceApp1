import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_user_provider.dart';
import 'package:provider/provider.dart';

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
    final userProvider =
        Provider.of<FirebaseUserProvider>(context, listen: false);
    userProvider.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme().primary,
      body: Stack(
        children: [
          UserProfileContainer(),
          Consumer<FirebaseUserProvider>(
            builder: (context, firebaseUserProvider, _) {
              final user = firebaseUserProvider.users[4];
              return UsernameAndPhotoSection(
                name: user.username ?? 'Unknown',
                id: user.id ?? 'Unknown',
              );
            },
          ),
        ],
      ),
    );
  }
}
