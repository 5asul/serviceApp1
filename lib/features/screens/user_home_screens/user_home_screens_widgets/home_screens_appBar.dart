import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

AppBar HomePageAppBar(BuildContext context,String screenName) {
    return AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () async {
                  
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
          );
  }