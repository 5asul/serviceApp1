import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_user_provider.dart';
import 'config/root/app_root.dart';
import 'config/root/app_root.dart';
import 'controller/firebase/provider/firebaes_review_provider.dart';
import 'controller/firebase/provider/firebase_request_provider.dart';

import 'features/state_managment/provider/add_order_provider.dart';
import 'features/state_managment/provider/service_app_provider.dart';
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

  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('==========User is currently signed out!');
      } else {
        log('==========User is signed in!');
      }
    });

    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ServiceAppProvider>(
            create: (_) => ServiceAppProvider()),
        ChangeNotifierProvider<FirebaseUserProvider>(
            create: (_) => FirebaseUserProvider()),
        ChangeNotifierProvider<FirebaseReviewProvider>(
          create: (_) => FirebaseReviewProvider(),
        ),
        ChangeNotifierProvider<AddOrderProvider>(
            create: (_) => AddOrderProvider()),
        ChangeNotifierProvider<FirebaseRequestProvider>(
            create: (_) => FirebaseRequestProvider())
        // ChangeNotifierProvider<AuthService>(create: (_) => AuthService()),
        // ChangeNotifierProvider<CartModel>(create: (_) => CartModel()),
        // ChangeNotifierProvider<OrderModel>(create: (_) => OrderModel()),
        // ChangeNotifierProvider<ProductModel>(create: (_) => ProductModel()),
        // ChangeNotifierProvider<CategoryModel>(create: (_) => CategoryModel()),
        // ChangeNotifierProvider<NotificationModel>(create: (_) => NotificationModel()),
        // ChangeNotifierProvider<SettingModel>(create: (_) => SettingModel()),
        // ChangeNotifierProvider<HomeModel>(create: (_) => HomeModel()),
        // ChangeNotifierProvider<SearchModel>(create: (_) => SearchModel()),
        // ChangeNotifierProvider<WishlistModel>(create: (_) => WishlistModel()),
        // ChangeNotifierProvider<HelpModel>(create: (_) => HelpModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(118, 171, 174, 1.0),
          hintColor: Colors.green,
          brightness: Brightness.light,
        ),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
