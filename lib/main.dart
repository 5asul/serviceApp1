
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/nav_pages/add_order_page.dart';
import 'package:project_for_all/screens/add_order_screen.dart';
import 'package:project_for_all/nav_pages/homePage.dart';
import 'package:project_for_all/screens/login_screen.dart';
import 'package:project_for_all/nav_pages/orders_page.dart';
import 'package:project_for_all/screens/select_role_screen.dart';
import 'package:project_for_all/screens/sign_up_screen.dart';
import 'package:project_for_all/screens/worker_profile_screen.dart';
import 'package:project_for_all/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'containers/category_container_page.dart';
import 'containers/home_container_page.dart';

late SharedPreferences sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('==========User is currently signed out!');
    } else {
      print('==========User is signed in!');
    }
  });
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(118, 171, 174, 1.0),
        hintColor: Colors.green,
        brightness: Brightness.light,
      ),
      initialRoute: FirebaseAuth.instance.currentUser == null  ? "login" : "container",
      routes: {
        "SignUp": (context) => SignUpScreen(),
        "login": (context) => LoginScreen(),
        "home": (context) => HomePage(),
        "orders": (context) => OrdersScreen(),
        "add order": (context) => AddOrder(),
        "add order1": (context) => AddOrderScreen(),
        "container": (context) => HomeContainerPage(),
        "categoryContainer": (context) => CategoriesContainerPage(),
        "test": (context) => TestApp(),
        "rolePage": (context) => SelectRoleScreen(),
        "worker profile": (context) => WorkerProfileScreen(),
      },
    );
  }
}
