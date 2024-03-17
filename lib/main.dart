import 'package:flutter/material.dart';
import 'package:project_for_all/homePage.dart';
import 'package:project_for_all/login.dart';
import 'package:project_for_all/signUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(118, 171, 174,1.0),

        hintColor: Colors.green,
        brightness: Brightness.light,
      ),
      home: HomePage(),
      routes: {
        "SignUp":(context) => SignUp(),
        "login":(context)=> LoginPage()
      },
    );
  }
}