import 'package:flutter/material.dart';

import 'package:project_for_all/features/screens/user_home_screens/home_page/old_pages/all_worker.dart';
import 'package:project_for_all/features/screens/user_home_screens/home_page/old_pages/cleaning_workers.dart';
import 'package:project_for_all/features/screens/user_home_screens/home_page/old_pages/teaching_workers.dart';
import 'package:project_for_all/features/screens/user_home_screens/orders_history_page/all_orders.dart';
import 'package:project_for_all/features/screens/user_home_screens/orders_history_page/cleaning_orders.dart';
import 'package:project_for_all/features/screens/user_home_screens/orders_history_page/teaching_orders.dart';

import '../../../../config/theme/colors_theme.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int i = 0;
  List<Widget> nav = [AllOrders(), CleaningOrders(), TeachingOrders()];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          i = index;
                        });
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: i == index
                                    ? ColorsTheme().primary
                                    : ColorsTheme().primary.withOpacity(0.3))),
                        child: Text(
                          "${WorkerCategory[index]}",
                          style: TextStyle(
                              color: i == index
                                  ? ColorsTheme().primary
                                  : ColorsTheme().primary),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              nav.elementAt(i)
            ],
          ),
        ),
      ),
    );
  }
}

List<String> WorkerCategory = [
  "All Orders",
  "Cleaning Orders",
  "Teaching Orders"
];























// import 'package:flutter/material.dart';
// import 'package:project_for_all/controller/componentAPI/crud_mysql_api.dart';
// import 'package:project_for_all/constent/linkapi.dart';
// import 'package:project_for_all/widget/costum/costum_booking_card.dart';
// import 'package:project_for_all/widget/costum/custom_card.dart';
// import 'package:project_for_all/controller/database/sqfLite.dart';
// import 'package:project_for_all/main.dart';

// import '../containers/home_container_page.dart';

// class OrdersScreen extends StatefulWidget {
//   const OrdersScreen({super.key});

//   @override
//   State<OrdersScreen> createState() => _OrdersScreenState();
// }

// class _OrdersScreenState extends State<OrdersScreen> with Crud {
//   DatabaseHelper sqlDb = DatabaseHelper();
//   getService() async {
//     await Future.delayed(Duration(seconds: 1));
//     print("${sharedPref.getString('id')}");
//     try {
//       List<Map> response = await sqlDb.readData(
//           "SELECT * FROM 'services'WHERE user_id = '${sharedPref.getString('id')}'");
//       return response;
//     } catch (e) {
//       print('Caught a FormatException:$e.message');
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: secondary,
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//             child: ListView(children: [
//           OrdersCard(time: "2:00", service_name: "cleaning", id: "1"),
//           // FutureBuilder(
//           //     future: getService(),
//           //     builder: (BuildContext context, AsyncSnapshot snap) {
//           //       if (snap.hasData) {
//           //         return ListView.builder(
//           //             itemCount: snap.data.length,
//           //             shrinkWrap: true,
//           //             physics: NeverScrollableScrollPhysics(),
//           //             itemBuilder: (context, i) {
//           //               try {
//           //                 return CustomCard(
//           //                   time: snap.data[i]['time'].toString(),
//           //                   srevice_name: "${snap.data[i]['service_name']}",
//           //                   id: snap.data[i]['id'].toString(),
//           //                 );
//           //               } catch (e) {
//           //                 print('error :$e');
//           //               }
//           //             });
//           //       }
//           //       if (snap.connectionState == ConnectionState.waiting) {
//           //         return Center(
//           //           child: CircularProgressIndicator(),
//           //         );
//           //       } else if (snap.hasError) {
//           //         return Center(child: Text('Failed to connect to server'));
//           //       }
//           //       return Center(child: Text('No Data Found'));
//           //     })
//         ])),
//       ),
//     );
//   }
// }
