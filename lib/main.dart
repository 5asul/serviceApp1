import 'package:flutter/material.dart';
import 'package:project_for_all/continerPage.dart';
import 'package:project_for_all/costum/dropDowns.dart';
import 'package:project_for_all/login.dart';
import 'package:project_for_all/orders_page.dart';
import 'package:project_for_all/signUp.dart';
import 'package:project_for_all/test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'addOrderPage.dart';
import 'homePage.dart';

late SharedPreferences sharedPref;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primaryColor: Color.fromRGBO(118, 171, 174,1.0),

        hintColor: Colors.green,
        brightness: Brightness.light,
      ),

      initialRoute: sharedPref.getString("id")==null ? "login" : "container",
      routes: {
        "SignUp":(context) => SignUp(),
        "login":(context)=> LoginPage(),
        "home":(context) => HomePage(),
        "orders":(context) => Orders(),
        "add order":(context) => AddOrder(),
        "container":(context) => ContinerPage(),
        "test":(context) => TestApp()


      },
    );
  }
}