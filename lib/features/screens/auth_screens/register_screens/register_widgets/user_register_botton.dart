import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/controller/firebase/provider/api_user_provider.dart';

import 'package:project_for_all/main.dart';
import 'package:project_for_all/models/api_users_model.dart';
import 'package:provider/provider.dart';

import '../../../../../config/theme/colors_theme.dart';
import '../../../../../controller/firebase/provider/firebase_user_provider.dart';
import '../../../../../models/users_model.dart';

class UserRegisterButton extends StatefulWidget {
  const UserRegisterButton({
    super.key,
  });

  @override
  State<UserRegisterButton> createState() => _UserRegisterButtonState();
}

class _UserRegisterButtonState extends State<UserRegisterButton> {
  Future<void> addRegisterInfo() async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      final apiProvider = Provider.of<ApiUserProvider>(context, listen: false);
      final userProvider =
          Provider.of<FirebaseUserProvider>(context, listen: false);
      String? uplode;
      if (userProvider.profilePictureController.text.isNotEmpty) {
        final file = File(userProvider.profilePictureController.text);

        uplode = await userProvider.uploadFile(file);
      }

      UserModel newUser = await UserModel(
        firebaseUid: user!.uid,
        username: userProvider.usernameController.text,
        email: sharedPref.getString('email'),
        password: sharedPref.getString('password'),
        phone: userProvider.phoneController.text,
        location: sharedPref.getString('location'),
        role: sharedPref.getString('role'),
        serviceName: sharedPref.getString('serviceName') ?? 'unknown',
        profilePic: uplode ?? null,
        workerIdPicture:
            userProvider.workerIdPictureController.text ?? 'unknown',
      );
      ApiUserModel apiUserModel = ApiUserModel(
        firebaseUid: user.uid,
        id: 0,
        username: userProvider.usernameController.text,
        email: sharedPref.getString('email'),
        phone: userProvider.phoneController.text,
        location: sharedPref.getString('location'),
        role: sharedPref.getString('role'),
        skills: sharedPref.getString('serviceName') ?? 'unknown',
        profilePic: uplode ?? null,
        workerIdPicture:
            userProvider.workerIdPictureController.text ?? 'unknown',
      );
      await userProvider.addUser(newUser).then(
        (value) async {
          await apiProvider.addUser(apiUserModel);
        },
      );
      return;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorsTheme().primary,
      child: MaterialButton(
        onPressed: () async {
          await addRegisterInfo().then((value) {
            if (sharedPref.getString('role') == 'costumer') {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('user home screen', (root) => false);
            } else if (sharedPref.getString('role') == 'worker') {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  'worker home screen', (root) => false);
            }
          });
        },
        child: Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
