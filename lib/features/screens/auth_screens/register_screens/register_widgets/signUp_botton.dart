import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:project_for_all/features/state_managment/provider/change_notifier_class.dart';
import 'package:project_for_all/main.dart';
import 'package:provider/provider.dart';

import '../../../../../config/theme/colors_theme.dart';
import '../../../../../controller/firebase/provider/firebase_user_provider.dart';
import '../../../../../models/users_model.dart';

class SignUpButton extends StatefulWidget {
  const SignUpButton({
    super.key,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
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
            Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
      }
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  Future sendVerficationEmail() async {
    try {} catch (ex) {
      final user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification;
      print('$ex');
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
                    'Sign Up',
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
      Navigator.of(context).pushReplacementNamed('info register');
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
  //  void _checkEmailVerifiedPeriodically() async {

  //   Timer.periodic(Duration(seconds: 2), (timer) async {
  //     await user!.reload();
  //     if (user.emailVerified) {
  //       timer.cancel();

  //     }
  //   });
  // }

  // Future<void> _checkEmailVerified() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   await user!.reload();
  //   while (!isEmailVerified) {
  //     await Future.delayed(Duration(seconds: 2));
  //     await user.reload();
  //   }
  // }
}

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../../config/theme/colors_theme.dart';
// import '../../../../state_managment/provider/change_notifier_class.dart';
//
// Container SignUpBotton(BuildContext context) {
//   bool signUp_state = true;
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   bool isLoading = false;
//   return Container(
//     width: double.infinity,
//     color: ColorsTheme().primary,
//     child: MaterialButton(
//         onPressed: isLoading?null:() async {
//
//           try {
//
//             final credential =
//                 await FirebaseAuth.instance.createUserWithEmailAndPassword(
//               email: email.text,
//               password:
//                   password.text,
//             );
//             Navigator.of(context).pushReplacementNamed('login');
//
//             await FirebaseAuth.instance.currentUser!.sendEmailVerification();
//           } on FirebaseAuthException catch (e) {
//             if (e.code == 'weak-password') {
//               AwesomeDialog(
//                       context: context,
//                       dialogType: DialogType.error,
//                       title: "Error",
//                       desc: "The password provided is too weak.")
//                   .show();
//               print('The password provided is too weak.');
//             } else if (e.code == 'email-already-in-use') {
//               AwesomeDialog(
//                       context: context,
//                       dialogType: DialogType.error,
//                       title: "Error",
//                       desc: "The account already exists for that email.")
//                   .show();
//               print('The account already exists for that email.');
//             }
//           } catch (e) {
//             print(e);
//           }
//         },
//         child: Text(
//           'Sign Up',
//           style: TextStyle(color: Colors.white),
//         )),
//   );
// }

