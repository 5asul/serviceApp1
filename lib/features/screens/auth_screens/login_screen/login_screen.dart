import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/controller/auth/sign_in_controller.dart';
import 'package:project_for_all/controller/componentAPI/crud_mysql_api.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_user_provider.dart';
import 'package:project_for_all/main.dart';
import 'package:provider/provider.dart';

import '../auth_widgets/costom_email_textField.dart';
import '../auth_widgets/costom_password_textField.dart';
import 'login_widgets/dont_have_account.dart';
import 'login_widgets/login_app_bar.dart';
import 'login_widgets/login_botton.dart';
import 'login_widgets/login_strok_text.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Crud {
  SignInController signInController = SignInController();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    final usersProvider =
        Provider.of<FirebaseUserProvider>(context, listen: false);
    usersProvider.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<FirebaseUserProvider>(context, listen: false);

    return Scaffold(
      appBar: LoginAppBar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/paper1.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoginStrokText(),
                    SizedBox(
                      height: 40.0,
                    ),
                    EmailTextField(
                      email: email,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    PasswordTextFeild(password: password),
                    SizedBox(
                      height: 25.0,
                    ),
                    LoginBotton(
                      text: 'LOGIN',
                      onPressed: () async {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email.text, password: password.text)
                              .then((value) {
                            for (var i in users.users) {
                              if (i.email == email.text &&
                                  i.role == 'costumer') {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    'user home screen', (root) => false);
                              } else if (i.email == email.text &&
                                  i.role == 'worker') {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    'worker home screen', (root) => false);
                              }
                            }
                          });
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    title: "Error",
                                    desc: "No user found for that email.")
                                .show();
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    title: "Error",
                                    desc:
                                        "Wrong password provided for that user.")
                                .show();
                            print('Wrong password provided for that user.');
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    LoginBotton(
                        text: 'LOGIN with google',
                        onPressed: () async {
                          final result =
                              await signInController.signInWithGoogle();
                          result.fold(
                            (error) {
                              print(error);
                            },
                            (userCredential) async {
                              final email = userCredential.user?.email;
                              if (email != null) {
                                final userSnapshot = await FirebaseFirestore
                                    .instance
                                    .collection('users')
                                    .where('email', isEqualTo: email)
                                    .get();

                                if (userSnapshot.docs.isNotEmpty) {
                                  final userData =
                                      userSnapshot.docs.first.data();
                                  if (userData['role'] == 'costumer') {
                                    sharedPref.setString('role', 'costumer');
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            'user home screen',
                                            (route) => false);
                                  } else if (userData['role'] == 'worker') {
                                    sharedPref.setString('role', 'worker');
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            'worker home screen',
                                            (route) => false);
                                  }
                                } else {
                                  sharedPref.setString('email', email);
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      'role screen', (route) => false);
                                }
                              }
                            },
                          );
                        }),
                    SizedBox(
                      height: 10.0,
                    ),
                    DontHaveAnAccountRow(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
