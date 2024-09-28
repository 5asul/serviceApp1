import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_user_provider.dart';
import 'package:provider/provider.dart';

import '../worker_home_screens_widgets/worker_screens_appBar copy.dart';
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
    userProvider.getUsersStreamById(user!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WorkerPagesAppBar(context),
      backgroundColor: ColorsTheme().primary,
      body: Stack(
        children: [
          UserProfileContainer(),
          Consumer<FirebaseUserProvider>(
            builder: (context, firebaseUserProvider, _) {
              final user = firebaseUserProvider.users[0];
              return (firebaseUserProvider.users.isNotEmpty)
                  ? UsernameAndPhotoSection(
                      image: user.profilePic ?? 'Unknown',
                      name: user.username ?? 'Unknown',
                      id: user.firebaseUid ?? 'Unknown',
                    )
                  : CircularProgressIndicator(
                      color: ColorsTheme().primary,
                    );
            },
          ),
        ],
      ),
    );
  }
}
