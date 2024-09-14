import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:project_for_all/main.dart';
import 'package:provider/provider.dart';

import '../../../../../config/theme/colors_theme.dart';
import '../../../../../controller/firebase/provider/firebase_user_provider.dart';
import '../../../../../controller/firebase/provider/firebase_wokrer_provider.dart';
import '../../../../../models/users_model.dart';
import '../../../../../models/worker_model.dart';

class WorkerRegisterButton extends StatefulWidget {
  const WorkerRegisterButton({
    super.key,
    required this.username,
    required this.profilePicture,
    required this.phone,
    required this.workerIdPicture,
  });

  final String username;
  final String phone;
  final String profilePicture;
  final String workerIdPicture;

  @override
  State<WorkerRegisterButton> createState() => _WorkerRegisterButtonState();
}

class _WorkerRegisterButtonState extends State<WorkerRegisterButton> {
  Future<void> addRegisterInfo() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final workerProvider =
          Provider.of<FirebaseWorkerProvider>(context, listen: false);
      WorkerModel newWorker = await WorkerModel(
        firebaseUid: user!.uid,
        username: widget.username,
        email: sharedPref.getString('email'),
        password: sharedPref.getString('password'),
        phone: widget.phone,
        location: sharedPref.getString('location'),
        role: sharedPref.getString('role'),
        serviceName: sharedPref.getString('serviceName'),
        profailePic: widget.profilePicture,
        workerIdPicture: widget.workerIdPicture,
      );
      
      return workerProvider.addWorker(newWorker);
      
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
