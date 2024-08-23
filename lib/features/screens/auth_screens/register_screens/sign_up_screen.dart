
import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';

import 'package:project_for_all/features/screens/auth_screens/register_screens/register_widgets/costom_signUp_textFeild.dart';
import 'package:provider/provider.dart';


import '../../../../controller/componentAPI/valid.dart';
import '../../../state_managment/provider/change_notifier_class.dart';
import '../auth_widgets/costom_email_textField.dart';
import '../auth_widgets/costom_password_textField.dart';
import 'register_widgets/login_to_your_account_text_row.dart';
import 'register_widgets/signUp_app_bar.dart';
import 'register_widgets/signUp_botton.dart';
import 'register_widgets/signUp_strok_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();


  bool isLoading = false;

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  List <String> roles = ['User','Worker'];

  bool signUp_state = true;
  @override
  Widget build(BuildContext context)  {
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
                      SignUpStrokText(),
                      SizedBox(
                        height: 40.0,
                      ),
                      Form(
                        key: formstate,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomSignUpTextFeild(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obSecure: false,
                              label: "Username",
                              icon: Icon(Icons.person),
                              valid: (var val) {
                                return validInput(val!, 3, 20);
                              },
                              myController: username,
                            ),
                            // SizedBox(
                            //   height: 15.0,
                            // ),
                            // Container(
                            //   width: AppSize.width(context)*1.0,
                            //   height: AppSize.height(context)*0.09,
                            //   child: Row(
                            //     children: [
                            //       RadioListTile(
                            //         title: Text(roles[0]),
                            //           value: roles[0],
                            //           groupValue: currentOption,
                            //           onChanged: (val){
                            //           currentOption = val.toString();
                            //           }),
                            //       RadioListTile(
                            //           title: Text(roles[1]),
                            //           value: roles[1],
                            //           groupValue: currentOption,
                            //           onChanged: (val){
                            //             currentOption = val.toString();
                            //           })
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: 15.0,
                            ),
                            EmailTextField(email: email),
                            SizedBox(
                              height: 15.0,
                            ),
                            PasswordTextFeild(password: password),
                            SizedBox(
                              height: 25.0,
                            ),
                            SignUpBotton(context,username.text,email.text,password.text,),
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



