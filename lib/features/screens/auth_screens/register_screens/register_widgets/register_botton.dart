import 'dart:async';

import 'package:flutter/material.dart';

import 'package:project_for_all/main.dart';
import 'package:provider/provider.dart';

import '../../../../../config/theme/colors_theme.dart';
import '../../../../../controller/firebase/provider/firebase_user_provider.dart';
import '../../../../../models/users_model.dart';

class RegisterButton extends StatefulWidget {
  const RegisterButton({
    super.key,
    required this.email,
    required this.password,
    required this.username,
    required this.picture,
    required this.phone,
  });

  final String username;
  final String email;
  final String password;
  final String phone;
  final String picture;

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  Future<void> addRegisterInfo() async {
    try {
      final userProvider =
          Provider.of<FirebaseUserProvider>(context, listen: false);
      UserModel newUser = await UserModel(
          username: widget.username,
          email: widget.email,
          role: sharedPref.getString('role'),
          location: sharedPref.getString('location'),
          skills: sharedPref.getString('skills'),
          profailePic: widget.picture,
          phone: widget.phone,
          firebaseUid: '2',
          id: '2');
      return userProvider.addUser(newUser);
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
          await addRegisterInfo();
          Navigator.of(context)
              .pushNamedAndRemoveUntil('home screen', (root) => false);
        },
        child: Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
