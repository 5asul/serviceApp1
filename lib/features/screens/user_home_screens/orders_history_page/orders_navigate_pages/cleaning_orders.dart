// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:project_for_all/controller/firebase/provider/firebaes_review_provider.dart';
// import 'package:project_for_all/controller/firebase/provider/firebase_request_provider.dart';
// import 'package:project_for_all/features/screens/user_home_screens/orders_history_page/orders_history_widgets/costom_orders_card.dart';
// import 'package:provider/provider.dart';

// import '../../../../../widget/costom/costom_worker1_card.dart';
// import '../../../../state_managment/provider/add_order_provider.dart';
// import '../edit_orders_screen.dart';

// class CleaningOrders extends StatefulWidget {
//   const CleaningOrders({super.key});

//   @override
//   State<CleaningOrders> createState() => _CleaningOrdersState();
// }

// class _CleaningOrdersState extends State<CleaningOrders> {
//   @override
//   void initState() {
//     super.initState();
//     final user = FirebaseAuth.instance.currentUser;
//     final requestProvider =
//         Provider.of<FirebaseRequestProvider>(context, listen: false);
//     requestProvider.getRequestsStreamById(user!.uid);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return Consumer<FirebaseRequestProvider>(
//         builder: (context, requestData, _) {
//       final cleaningRequestData = requestData.requests
//           .where((request) => request.serviceType == "Cleaning").toList();
//       return ListView.builder(
//         physics: BouncingScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: cleaningRequestData.length,
//         itemBuilder: ((context, index) {
//           final request = cleaningRequestData[index];
//           final reviewProvider =
//               Provider.of<FirebaseReviewProvider>(context, listen: false);
//           final requestProvider =
//               Provider.of<FirebaseRequestProvider>(context, listen: false);
//           return OrdersCard(requestsModel: requestData.requests[index],
//               screenSize: screenSize,
//               workDescription: request.workDescription ?? 'Unknown',
//               location: request.location ?? 'Unknown',
//               serviceType: request.serviceType ?? 'Unknown',
//               date: request.timeStamp ?? 'Unknown',
//               status: request.status ?? 'Unknown',
//               delete: () {
//                 requestProvider.deleteRequest(request.docid ?? 'Unknown');
//               },
//               update: () {
//                 Navigator.of(context).push(PageTransition(
//                     child: EditOrdersScreen(),
//                     type: PageTransitionType.rightToLeft));
//                 List<String> stamp = request.timeStamp!.split(' at ');
//                 for (var element in stamp) {
//                   log(element.toString());
//                   log('${element.contains('date:')}');
//                   if (element.contains('date:(')) {
//                     element.replaceFirst(RegExp(r'd'), '');
//                     log('replaceAll: ${element.replaceFirst(RegExp(r'date:'), '')}');
//                   }
//                 }
//                 // stamp.add();
//                 context.read<AddOrderProvider>().selectedCategoryCardName =
//                     request.serviceType ?? 'Unknown';
//                 context.read<AddOrderProvider>().selectedDateAndDay =
//                     stamp[0].replaceFirst(RegExp(r'date:'), '');
//                 context
//                     .read<AddOrderProvider>()
//                     .workDescriptionController
//                     .text = request.workDescription ?? 'Unknown';
//                 context.read<AddOrderProvider>().selectedTime = stamp[1].trim();
//                 context.read<AddOrderProvider>().state =
//                     request.status ?? 'unknown';
//                 context.read<AddOrderProvider>().state =
//                     request.status ?? 'unknown';
//                 context.read<AddOrderProvider>().requestModel = request;
//                 log(request.status!);
//               },
//               isSelected:
//                   requestProvider.userSelectedCardId == request.requestId,
//               selectedStatusButton: () {
//                 requestProvider.userSelectedCardId =
//                     request.requestId ?? 'unknown';
//               },
//               cancel: () {
//                 requestProvider.userSelectedCardId = '';
//               },
//               addReview: () {
//                 reviewProvider.requestId = request.requestId ?? 'Unknown';
//               });
//         }),
//       );
//     });
//   }
// }
