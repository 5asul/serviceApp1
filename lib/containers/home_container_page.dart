import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../controller/componentAPI/crud_mysql_api.dart';
import '../main.dart';
import '../nav_pages/add_order_page.dart';
import '../nav_pages/homePage.dart';
import '../nav_pages/orders_page.dart';

class HomeContainerPage extends StatefulWidget {
  const HomeContainerPage({super.key});

  @override
  State<HomeContainerPage> createState() => _HomePageState();
}

final Color primary = Color.fromRGBO(118, 171, 174, 1.0);
final Color secondary = Color.fromRGBO(238, 238, 238, 1.0);
final Color tertiary = Color.fromRGBO(149, 210, 179, 1.0);

class _HomePageState extends State<HomeContainerPage> with Crud {
  // getServic e() async {
  //   var response = await postRequest(linkOrderView, {
  //     "id" : sharedPref.get
  //   });
  // }

  List<Widget> _page = [HomePage(), OrdersScreen(), AddOrder()];
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
          color: primary,
          buttonBackgroundColor: primary,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              i = index;

              print(index);
              print(i);
            });
          },
          letIndexChange: (index) => true,
        ),
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            centerTitle: true,
            title: Text('Services App'),
            actions: [
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  sharedPref.clear();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("login", (route) => false);
                },
              )
            ]),
        backgroundColor: secondary,
        body: _page.elementAt(i));
  }
}

//كلاس عشان نوصل لليست

// اليست الخاص بالخدمات

// كلاس خاص بانشاء الكاردز


// class page1 extends StatefulWidget {
//   const page1({super.key});

//   @override
//   State<page1> createState() => _page1State();
// }

// class _page1State extends State<page1> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text("page 1"));
//   }
// }
