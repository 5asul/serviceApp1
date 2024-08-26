import 'package:flutter/material.dart';

import 'package:project_for_all/features/screens/auth_screens/register_screens/register_widgets/costom_signUp_textFeild.dart';
import 'package:provider/provider.dart';

import 'dart:io';

import '../../../state_managment/provider/change_notifier_class.dart';

import '../auth_widgets/costom_email_textField.dart';
import '../auth_widgets/costom_password_textField.dart';
import 'register_widgets/location_drop_down.dart';
import 'register_widgets/login_to_your_account_text_row.dart';
import 'register_widgets/phone_text_field.dart';
import 'register_widgets/register_botton.dart';
import 'register_widgets/select_picture.dart';
import 'register_widgets/signUp_app_bar.dart';
import 'register_widgets/signUp_botton.dart';
import 'register_widgets/signUp_strok_text.dart';
import 'register_widgets/skills_drop_down.dart';

class WorkerRegisterScreen extends StatefulWidget {
  const WorkerRegisterScreen({super.key});

  @override
  State<WorkerRegisterScreen> createState() => _WorkerRegisterScreenState();
}

class _WorkerRegisterScreenState extends State<WorkerRegisterScreen> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController pictureController = TextEditingController();
   TextEditingController phoneController = TextEditingController();

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
                      SignUpStrokText(),
                      SizedBox(
                        height: 40.0,
                      ),
                      Form(
                        key: formstate,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UsernameTextFeild(username: usernameController,),
                            SizedBox(
                              height: 15.0,
                            ),
                            EmailTextField(email: emailController),
                            SizedBox(
                              height: 15.0,
                            ),
                            PasswordTextFeild(password: passwordController),
                            SizedBox(
                              height: 15.0,
                            ),
                            PhoneTextField(phone:phoneController,),
                            SizedBox(
                              height: 15.0,
                            ),
                            SkillsDropDown(),
                            SizedBox(
                              height: 15.0,
                            ),
                            LocationDropDown(),
                            SizedBox(
                              height: 15.0,
                            ),
                            SelectPicture(
                              imageController: pictureController,
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            RegisterButton(
                              username: usernameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                                picture:pictureController.text ,
                                ),
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
