import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_for_all/controller/componentAPI/crud_mysql_api.dart';
import 'package:project_for_all/controller/componentAPI/valid.dart';

import 'package:project_for_all/controller/database/sqfLite.dart';
import 'package:project_for_all/main.dart';
import 'package:project_for_all/screens/sign_up_screen.dart';

import '../containers/home_container_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Crud {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isLoading = false;

  DatabaseHelper sqlDb = DatabaseHelper();

  Future<void> login() async {
    if (formstate.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        List<Map> response = await sqlDb.readData(
            "SELECT * FROM 'users' WHERE email = '${email.text}' AND password = '${password.text}'");
        if (response.isNotEmpty) {
          print('${response.first['email']}');
          sharedPref.setString("id", response.first['id'].toString());
          sharedPref.setString("email", response.first['email'].toString());
          sharedPref.setString(
              "password", response.first['password'].toString());

          Navigator.of(context)
              .pushNamedAndRemoveUntil('rolePage', (route) => false);
        } else {
          AwesomeDialog(
                  context: context,
                  title: "Error",
                  body: Text("your passowrd or your email is wrong"))
              .show();
        }
      } catch (error) {
        print("Login Error: $error");
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primary,
          title: Center(
              child: Text(
            "Login",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white),
          )),
          shadowColor: Colors.black,
          elevation: 10.0),
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
                  Stack(children: [
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 7.0
                            ..color = Colors.white54),
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                          shadows: [
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 2.0,
                              color: Colors.black,
                            )
                          ],
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: primary),
                    )
                  ]),
                  SizedBox(
                    height: 40.0,
                  ),
                  Form(
                    key: formstate,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) {
                        return validInput(val!, 2, 30);
                      },
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                      onChanged: (String value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      return validInput(val!, 2, 30);
                    },
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    onChanged: (String value) {
                      print(value);
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    width: double.infinity,
                    color: primary,
                    child: MaterialButton(
                      onPressed: () async {
                        await login();
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont\'t have an account',
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(PageTransition(
                                child: SignUpScreen(),
                                type: PageTransitionType.leftToRight));
                          },
                          child: Stack(
                            children: [
                              Text(
                                'Register',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 3.5
                                      ..color = Colors.white54),
                              ),
                              Text(
                                'Register',
                                style: TextStyle(color: primary),
                              ),
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
