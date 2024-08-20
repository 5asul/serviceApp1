import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../../config/theme/colors_theme.dart';
import '../../../controller/componentAPI/crud_mysql_api.dart';
import '../../../nav_pages/add_order_page.dart';
import 'home_page/homePage.dart';
import 'orders_history_page/orders_page.dart';
import 'user_home_screens_widgets/home_screens_appBar.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({super.key});

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> with Crud {

  List<Widget> _page = [HomePage(),OrdersPage(), AddOrder()];
  static int i = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: i,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.add, size: 30),
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
        appBar: HomePageAppBar(context, 'home page'),
        backgroundColor: ColorsTheme().secondary,
        body: _page.elementAt(i));
  }
}


