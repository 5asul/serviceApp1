import 'package:flutter/material.dart';

import 'package:project_for_all/features/screens/auth_screens/register_screens/register_widgets/costom_signUp_textFeild.dart';
import 'package:provider/provider.dart';

import '../../../state_managment/provider/service_app_provider.dart';
import '../auth_widgets/costom_email_textField.dart';
import '../auth_widgets/costom_password_textField.dart';
import 'register_widgets/email_auth_strok.dart';
import 'register_widgets/login_to_your_account_text_row.dart';
import 'register_widgets/signUp_app_bar.dart';
import 'register_widgets/email_auth_botton.dart';
import 'register_widgets/signUp_strok_text.dart';

class EmailAuthenticationScreen extends StatefulWidget {
  const EmailAuthenticationScreen({super.key});

  @override
  State<EmailAuthenticationScreen> createState() =>
      _EmailAuthenticationScreenState();
}

class _EmailAuthenticationScreenState extends State<EmailAuthenticationScreen> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  List<String> roles = ['User', 'Worker'];

  bool signUp_state = true;
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ServiceAppProvider>();
    String currentOption = roles[0];
    return Scaffold(
        appBar: SignUpAppBar(),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/paper1.jpg"), fit: BoxFit.cover)),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EmailAuthStrokText(),
                      SizedBox(
                        height: 40.0,
                      ),
                      Form(
                        key: formstate,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EmailTextField(email: email),
                            SizedBox(
                              height: 15.0,
                            ),
                            PasswordTextFeild(password: password),
                            SizedBox(
                              height: 25.0,
                            ),
                            EmailAuthenticationButton(
                                email: email.text, password: password.text),
                            SizedBox(
                              height: 10.0,
                            ),
                            LoginToYourAccountRow(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
