import 'package:flutter/material.dart';
import 'package:project_for_all/controller/componentAPI/crud_mysql_api.dart';


import 'login_widgets/costom_email_textField.dart';
import 'login_widgets/costom_password_textField.dart';
import 'login_widgets/dont_have_account.dart';
import 'login_widgets/login_app_bar.dart';
import 'login_widgets/login_botton.dart';
import 'login_widgets/login_strok_text.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Crud {
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
                    LoginBotton(email: email, password: password),
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










