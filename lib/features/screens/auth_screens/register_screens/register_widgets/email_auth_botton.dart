import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:project_for_all/features/state_managment/provider/service_app_provider.dart';
import 'package:project_for_all/main.dart';
import 'package:provider/provider.dart';

import '../../../../../config/theme/colors_theme.dart';
import '../../../../../controller/firebase/provider/firebase_user_provider.dart';
import '../../../../../models/users_model.dart';

class EmailAuthenticationButton extends StatefulWidget {
  const EmailAuthenticationButton({
    super.key,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  State<EmailAuthenticationButton> createState() =>
      _EmailAuthenticationButtonState();
}

class _EmailAuthenticationButtonState extends State<EmailAuthenticationButton> {
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      isEmailVerified = user.emailVerified;
      if (!isEmailVerified) {
        timer =
            Timer.periodic(Duration(seconds: 1), (_) => checkEmailVerified());
      }
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> checkEmailVerified() async {
    final provider = Provider.of<ServiceAppProvider>(context, listen: false);
    int retryCount = 0; // Maximum retries (adjust as needed)
    const duration = Duration(seconds: 2);

    while (retryCount < 10 && !isEmailVerified) {
      // Replace 3 with your desired limit
      await Future.delayed(duration);
      await FirebaseAuth.instance.currentUser!.reload();
      provider.isEmailVerified =
          FirebaseAuth.instance.currentUser!.emailVerified;
      print(provider.isEmailVerified);

      retryCount++;
    }

    if (provider.isEmailVerified == false) {
      // Handle verification timeout (e.g., show error message)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Email verification timed out after ${retryCount} retries'),
        ),
      );
      retryCount = 0;
      // print('Email verification timed out after ${retryCount} retries');
    } else {
      provider.isLoading = false;
      
      timer?.cancel();
      Navigator.of(context).pushReplacementNamed('role screen');
    }
  }

  Future<void> sendVerficationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ServiceAppProvider>();
    return Container(
      width: double.infinity,
      color: ColorsTheme().primary,
      child: Consumer<ServiceAppProvider>(
        builder: (context, provider, child) {
          return MaterialButton(
            onPressed: provider.isLoading ? null : _signUp,
            child: provider.isLoading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Text(
                    'Send Email Auth Message',
                    style: TextStyle(color: Colors.white),
                  ),
          );
        },
      ),
    );
  }

  Future<void> _signUp() async {
    context.read<ServiceAppProvider>().isLoading = true;

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email,
        password: widget.password,
      );

      await FirebaseAuth.instance.currentUser!.sendEmailVerification();

      // Check if the email is verified
      await checkEmailVerified();
      sharedPref.setString('email', widget.email);
      sharedPref.setString('password', widget.password);
    } on FirebaseAuthException catch (e) {
      context.read<ServiceAppProvider>().isLoading = false;

      if (e.code == 'weak-password') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: "Error",
          desc: "The password provided is too weak.",
        ).show();
      } else if (e.code == 'email-already-in-use') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: "Error",
          desc: "The account already exists for that email.",
        ).show();
      }
    } catch (e) {
      context.read<ServiceAppProvider>().isLoading = false;

      print(e);
    }
  }
}
