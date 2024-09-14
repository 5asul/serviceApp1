import 'package:flutter/material.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_user_provider.dart';

import 'package:project_for_all/features/screens/auth_screens/register_screens/register_widgets/costom_signUp_textFeild.dart';
import 'package:provider/provider.dart';

import '../../../state_managment/provider/service_app_provider.dart';
import 'register_widgets/location_drop_down.dart';
import 'register_widgets/login_to_your_account_text_row.dart';
import 'register_widgets/phone_text_field.dart';
import 'register_widgets/select_profile_picture.dart';
import 'register_widgets/signUp_app_bar.dart';
import 'register_widgets/signUp_strok_text.dart';
import 'register_widgets/user_register_botton.dart';

class UserRegisterScreen extends StatelessWidget {
  const UserRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = new GlobalKey<FormState>();

    List<String> roles = ['User', 'Worker'];

    bool signUp_state = true;

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
                            UsernameTextFeild(),
                            SizedBox(
                              height: 15.0,
                            ),
                            PhoneTextField(),
                            SizedBox(
                              height: 15.0,
                            ),
                            LocationDropDown(),
                            SizedBox(
                              height: 15.0,
                            ),
                            SelectProfilePicture(),
                            SizedBox(
                              height: 25.0,
                            ),
                            UserRegisterButton(),
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
