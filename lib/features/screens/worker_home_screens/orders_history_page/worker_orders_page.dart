import 'package:flutter/material.dart';

import 'package:project_for_all/features/screens/user_home_screens/orders_history_page/orders_navigate_pages/all_orders.dart';
import 'package:project_for_all/features/screens/user_home_screens/orders_history_page/orders_navigate_pages/cleaning_orders.dart';
import 'package:project_for_all/features/screens/user_home_screens/orders_history_page/orders_navigate_pages/teaching_orders.dart';

import 'orders_history_widgets/orders_nav_bottons.dart';
import 'orders_navigate_pages/all_worker_orders.dart';

class WorkerOrdersPage extends StatefulWidget {
  const WorkerOrdersPage({super.key});

  @override
  State<WorkerOrdersPage> createState() => _WorkerOrdersPageState();
}

class _WorkerOrdersPageState extends State<WorkerOrdersPage> {
  
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child:AllWorkerOrders()
         
        ),
      ),
    );
  }
}



























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
