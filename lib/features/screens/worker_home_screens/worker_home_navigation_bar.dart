import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:project_for_all/features/screens/user_home_screens/profile_page/user_profile_page.dart';
import 'package:provider/provider.dart';
import '../../../config/theme/colors_theme.dart';
import '../../../controller/componentAPI/crud_mysql_api.dart';

import '../../../controller/firebase/provider/firebase_user_provider.dart';
import 'orders_history_page/worker_orders_page.dart';
import 'profile_page/worker_profile_page.dart';
import 'worker_home_screens_widgets/home_screens_appBar.dart';

class WorkerHomeNavigationBar extends StatefulWidget {
  const WorkerHomeNavigationBar({super.key});

  @override
  State<WorkerHomeNavigationBar> createState() =>
      _WorkerHomeNavigationBarState();
}

class _WorkerHomeNavigationBarState extends State<WorkerHomeNavigationBar>
    with Crud {
  List<Widget> _page = [WorkerOrdersPage(), WorkerProfilePage()];
  static int i = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    final provider = Provider.of<FirebaseUserProvider>(context, listen: false);
    provider.getUsersStreamById(user!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: i,
          height: 60.0,
          items: <Widget>[
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
