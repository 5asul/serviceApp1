import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/controller/auth/sign_in_controller.dart';
import 'package:project_for_all/controller/componentAPI/crud_mysql_api.dart';

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
  Widget build(BuildContext context) {
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
                    EmailTextField(email: email),
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
                                  email: email.text, password: password.text);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              'container', (root) => false);
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
                        await signInController.signInWithGoogle().then(
                          (value) {
                            Navigator.of(context).pushNamed('rolePage');
                          },
                        );
                      },
                      routeName: 'container',
                    ),
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
