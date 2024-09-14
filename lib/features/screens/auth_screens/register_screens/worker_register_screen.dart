import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:project_for_all/features/screens/auth_screens/register_screens/register_widgets/costom_signUp_textFeild.dart';
import 'package:provider/provider.dart';

import '../../../state_managment/provider/service_app_provider.dart';

import 'register_widgets/location_drop_down.dart';
import 'register_widgets/login_to_your_account_text_row.dart';
import 'register_widgets/phone_text_field.dart';
import 'register_widgets/select_worker_id_picture.dart';
import 'register_widgets/worker_register_botton.dart';
import 'register_widgets/select_profile_picture.dart';
import 'register_widgets/signUp_app_bar.dart';
import 'register_widgets/signUp_strok_text.dart';
import 'register_widgets/services_drop_down.dart';

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
  TextEditingController workerIdPicture = TextEditingController();
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
                            UsernameTextFeild(),
                            SizedBox(
                              height: 15.0,
                            ),
                            PhoneTextField(),
                            SizedBox(
                              height: 15.0,
                            ),
                            ServicesDropDown.ServicesDropDown(),
                            SizedBox(
                              height: 15.0,
                            ),
                            LocationDropDown(),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              children: [
                                SelectProfilePicture(),
                                SelectWorkerIdPicture(
                                    workerIdPictureController: workerIdPicture)
                              ],
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            WorkerRegisterButton(
                              username: usernameController.text,
                              phone: phoneController.text,
                              profilePicture: pictureController.text,
                              workerIdPicture: workerIdPicture.text,
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
