import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';

import 'custom_worker_list_tile.dart';

class WorkerDrawerWidget extends StatelessWidget {
  const WorkerDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsTheme().primary,
      child: ListView(
        children: [
          DrawerHeader(
              child: Align(
            alignment: Alignment.center,
            child: Container(child: Image.asset("assets/images/logo.png")),
          )),
          CustomWorkerListTile(icon: Icons.settings, title: 'Settings'),
          CustomWorkerListTile(icon: Icons.help, title: 'Help'),
          CustomWorkerListTile(
              icon: Icons.star_rate_outlined, title: 'Rate the app'),
          CustomWorkerListTile(
            onTap: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              try {
                await FirebaseAuth.instance.signOut();
              } catch (e) {
                log('خطاء في تسجيل الخروج: $e');
              }
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("login", (route) => false);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                'تم تسجيل الخروج بنجاح',
                textDirection: TextDirection.rtl,
              )));
            },
            icon: Icons.logout_outlined,
            title: 'تسجيل خروج',
          ),
        ],
      ),
    );
  }
}
