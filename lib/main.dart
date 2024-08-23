import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'config/root/app_root.dart';
import 'features/state_managment/provider/change_notifier_class.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  sharedPref = await SharedPreferences.getInstance();
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('==========User is currently signed out!');
    } else {
      print('==========User is signed in!');
    }
  });
  runApp(ChangeNotifierProvider(
    create: (context) => ServiceAppProvider(),
    child: MyApp(),
  ),);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
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
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
