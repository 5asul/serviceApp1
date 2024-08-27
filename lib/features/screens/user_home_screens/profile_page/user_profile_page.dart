import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_user_provider.dart';
import 'package:provider/provider.dart';


import 'profile_page_widgets/user_profile_container.dart';
import 'profile_page_widgets/username_and_photo_section.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<FirebaseUserProvider>(context);
    userProvider.fetchUsers();
    return Scaffold(
      backgroundColor: ColorsTheme().primary,
      body: Container(
        child: Stack(
          children: [
            UserProfileContainer(),
            Consumer<FirebaseUserProvider>(
              builder: (context, firebaseUserProvider, _) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: firebaseUserProvider.users.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: UsernameAndPhotoSection(
                        name: firebaseUserProvider.users[index].username!,
                        id: firebaseUserProvider.users[index].id!,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
