import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';
import 'package:project_for_all/controller/firebase/provider/api_user_provider.dart';
import 'package:provider/provider.dart';

AppBar HomePageAppBar(
  BuildContext context,
) {
  bool majorSwitchval = false;
  final provider = Provider.of<ApiUserProvider>(context, listen: false);
  return AppBar(
      backgroundColor: ColorsTheme().primary,
      centerTitle: true,
      title: Container(
          width: AppSize.width(context) * 0.4,
          height: AppSize.height(context) * 0.2,
          child: Image.asset("assets/images/logo.png")),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: ColorsTheme().background,
          ),
          onPressed: () async {},
        )
      ]);
}
