import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_for_all/features/screens/user_home_screens/orders_history_page/edit_orders_screen.dart';
import 'package:project_for_all/features/state_managment/provider/add_order_provider.dart';
import 'package:project_for_all/nav_pages/add_order_page.dart';
import 'package:provider/provider.dart';

import '../../../../../controller/firebase/provider/firebase_request_provider.dart';

import '../../../../../models/requests_model.dart';
import '../orders_history_widgets/costom_worker_orders_card.dart';
import '../../../../../widget/costom/costom_worker1_card.dart';

class AllWorkerOrders extends StatefulWidget {
  const AllWorkerOrders({super.key});

  @override
  State<AllWorkerOrders> createState() => _AllWorkerOrdersState();
}

class _AllWorkerOrdersState extends State<AllWorkerOrders> {
  @override
  void initState() {
    super.initState();
    final requestProvider =
        Provider.of<FirebaseRequestProvider>(context, listen: false);
    requestProvider.fetchRequests();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Consumer<FirebaseRequestProvider>(
        builder: (context, requestData, _) {
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: requestData.requests.length,
        itemBuilder: ((context, index) {
          final request = requestData.requests[index];
          final watchOrder = context.watch<AddOrderProvider>();
          final readOrder = context.read<AddOrderProvider>();
          final requestProvider =
              Provider.of<FirebaseRequestProvider>(context, listen: false);
          return WorkerOrdersCard(
            screenSize: screenSize,
            workDescription: request.workDescription ?? 'Unknown',
            location: request.location ?? 'Unknown',
            serviceType: request.serviceType ?? 'Unknown',
            date: request.timeStamp ?? 'Unknown',
            status: request.status ?? 'Unknown',
            idIsEqual:
                requestProvider.selectedCardId == request.requestId,
            update: () async {
              List<String> stamp = request.timeStamp!.split(' at ');
              for (var element in stamp) {
                log(element.toString());
                log('${element.contains('date:')}');
                if (element.contains('date:(')) {
                  element.replaceFirst(RegExp(r'd'), '');
                  log('replaceAll: ${element.replaceFirst(RegExp(r'date:'), '')}');
                }
              }
              // stamp.add();
              readOrder.selectedCategoryCardName =
                  request.serviceType ?? 'Unknown';
              readOrder.selectedDateAndDay =
                  stamp[0].replaceFirst(RegExp(r'date:'), '');
              readOrder.workDescriptionController.text =
                  request.workDescription ?? 'Unknown';
              readOrder.selectedTime = stamp[1].trim();
              readOrder.state =
                  requestProvider.selectedStatusButton;
              readOrder.state =
                  request.status ?? 'unknown';
              readOrder.requestModel = request;
              log(request.status!);

              RequestsModel newRequest = RequestsModel(
          docid: watchOrder.requestModel.docid,
          requestId: request.docid,
          clientId: watchOrder.requestModel.clientId,
          workerId: watchOrder.requestModel.workerId,
          location: watchOrder.requestModel.location,
          serviceType: watchOrder.selectedCategoryCardName,
          workDescription: watchOrder.workDescriptionController.text,
          status: requestProvider.selectedStatusButton,
          timeStamp:
              'date:${watchOrder.selectedDateAndDay} at ${watchOrder.selectedTime}',
        );
        return requestProvider.updateRequest(newRequest);
     
            },
            selectedCardId: () async {
              requestProvider.selectedCardId = request.requestId ?? 'unknown';
              
              
             
            },
            cancel: () {
              requestProvider.selectedCardId = '';
            },
          );
        }),
      );
    });
  }
}

List<Worker1Card> cardInfo = [
  Worker1Card(
      name: "Ahmed",
      numberOfOrders: "10",
      image: "assets/teacher.jpg",
      rank: "5.0",
      icon: Icons.book_rounded),
  Worker1Card(
      name: "Saleh",
      numberOfOrders: "15",
      image: "assets/cleaner.jpg",
      rank: "4.0",
      icon: Icons.cleaning_services)
];
