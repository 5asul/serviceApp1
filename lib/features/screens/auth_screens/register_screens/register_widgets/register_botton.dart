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
  Future<void> _addRegisterInfo() async {
    try {
      final userProvider =
          Provider.of<FirebaseUserProvider>(context, listen: false);
      UserModel newUser = await UserModel(
          username: widget.username,
          email: widget.email,
          role: sharedPref.getString('role'),
          location: sharedPref.getString('location'),
          skills: sharedPref.getStringList('skills'),
          profailePic: widget.picture,
          phone: widget.phone,
          firebaseUid: '1',
          id: '1');
      userProvider.addUser(newUser);
    } catch (e) {
      print(e);
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
            onPressed: () async {
              await _addRegisterInfo;
              print(
                  '================information registered================================');
            },
            child: Text(
              'Register',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
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

