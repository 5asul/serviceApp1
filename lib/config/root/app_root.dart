import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/features/screens/auth_screens/register_screens/email_authentication_screen.dart';
import 'package:project_for_all/features/screens/auth_screens/register_screens/user_register_screen.dart';
import 'package:project_for_all/features/screens/auth_screens/register_screens/worker_register_screen.dart';
import 'package:project_for_all/features/screens/user_home_screens/home_page/category_screen/category_base.dart';
import 'package:project_for_all/features/screens/auth_screens/register_screens/select_role_screen.dart';
import 'package:project_for_all/features/screens/user_home_screens/home_navigation_bar.dart';
import 'package:project_for_all/features/screens/user_home_screens/home_page/add_order_screen/add_order_screen.dart';
import 'package:project_for_all/features/screens/user_home_screens/home_page/category_screen/worker_profile_screen/worker_profile_screen.dart';
import 'package:project_for_all/nav_pages/add_order_page.dart';

import '../../features/screens/auth_screens/login_screen/login_screen.dart';
import '../../features/screens/user_home_screens/home_page/category_screen/worker_profile_screen/chat_with_worker_screen.dart';
import '../../features/screens/user_home_screens/home_page/homePage.dart';
import '../../features/screens/user_home_screens/orders_history_page/orders_page.dart';
import '../../features/screens/worker_home_screens/worker_home_navigation_bar.dart';
import '../../main.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        return _materialRoute(LoginScreen());

      // case 'SignUp':
      //   return _materialRoute(SignUpScreen());

      case 'verify email':
        return _materialRoute(EmailAuthenticationScreen());

      case 'role screen':
        return _materialRoute(SelectRoleScreen());

      case 'user register':
        return _materialRoute(UserRegisterScreen());

      case 'worker register':
        return _materialRoute(WorkerRegisterScreen());

      case 'home':
        return _materialRoute(HomePage());

      case 'orders':
        return _materialRoute(OrdersPage());

      case 'add order':
        return _materialRoute(AddOrder());

      case 'add order1':
        return _materialRoute(AddOrderScreen());

      case 'chat with worker screen':
        return _materialRoute(ChatWithWorkerScreen());

      case 'user home screen':
        return _materialRoute(HomeNavigationBar());

      case 'worker home screen':
        return _materialRoute(WorkerHomeNavigationBar());

      case 'categoryContainer':
        return _materialRoute(CategoriesContainerPage());

      case 'worker profile':
        return _materialRoute(WorkerProfileScreen());

      default:
        return (sharedPref.getString('role') == 'costumer')
            ? (FirebaseAuth.instance.currentUser != null &&
                    FirebaseAuth.instance.currentUser!.emailVerified)
                ? _materialRoute(HomeNavigationBar())
                : _materialRoute(LoginScreen())
            : (FirebaseAuth.instance.currentUser != null &&
                    FirebaseAuth.instance.currentUser!.emailVerified)
                ? _materialRoute(WorkerHomeNavigationBar())
                : _materialRoute(LoginScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (context) => view);
  }
}
