import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

AppBar HomePageAppBar(BuildContext context, String screenName) {
  return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      centerTitle: true,
      title: Text(screenName), 
      actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () async {
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
        )
      ]);
}
