import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:project_for_all/controller/firebase/provider/api_user_provider.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_user_provider.dart';
import 'package:project_for_all/features/screens/user_home_screens/profile_page/user_profile_page.dart';
import 'package:project_for_all/models/api_users_model.dart';
import 'package:provider/provider.dart';
import '../../../config/theme/colors_theme.dart';
import '../../../controller/componentAPI/crud_mysql_api.dart';
import '../../../controller/firebase/provider/firebase_request_provider.dart';
import 'home_page/homePage.dart';
import 'orders_history_page/orders_page.dart';
import 'user_home_screens_widgets/base_home_screens_appBar.dart';
import 'user_home_screens_widgets/home_screens_appBar.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({super.key});

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  List<Widget> _page = [HomePage(), OrdersPage(), UserProfilePage()];
  static int i = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    final userProvider =
        Provider.of<FirebaseUserProvider>(context, listen: false);
    userProvider.fetchUsers();

    final requestProvider =
        Provider.of<FirebaseRequestProvider>(context, listen: false);
    requestProvider.getRequestsStreamById(user!.uid);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FirebaseUserProvider>(context, listen: false);
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: i,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.person, size: 30),
          ],
          color: ColorsTheme().primary,
          buttonBackgroundColor: ColorsTheme().primary,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              i = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        backgroundColor: ColorsTheme().background,
        body: _page.elementAt(i));
  }
}
