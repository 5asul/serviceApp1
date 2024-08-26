import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:project_for_all/features/screens/user_home_screens/profile_page/user_profile_page.dart';
import '../../../config/theme/colors_theme.dart';
import '../../../controller/componentAPI/crud_mysql_api.dart';
import 'home_page/homePage.dart';
import 'orders_history_page/orders_page.dart';
import 'user_home_screens_widgets/home_screens_appBar.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({super.key});

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> with Crud {
  List<Widget> _page = [HomePage(), OrdersPage(), UserProfilePage()];
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
        appBar: HomePageAppBar(context, 'home page'),
        backgroundColor: ColorsTheme().white,
        body: _page.elementAt(i));
  }
}
