import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_user_provider.dart';
import 'package:provider/provider.dart';

import 'profile_page_widgets/user_profile_container.dart';
import 'profile_page_widgets/username_and_photo_section.dart';

class WorkerProfilePage extends StatefulWidget {
  const WorkerProfilePage({super.key});

  @override
  _WorkerProfilePageState createState() => _WorkerProfilePageState();
}

class _WorkerProfilePageState extends State<WorkerProfilePage> {
  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    final userProvider =
        Provider.of<FirebaseUserProvider>(context, listen: false);
    userProvider.getUsersStreamById("7pYrEdI8F0aD6e5APhso0teF2m92");
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
              final user = firebaseUserProvider.user;
              return UsernameAndPhotoSection(
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
