import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_request_provider.dart';
import 'package:project_for_all/features/state_managment/provider/add_order_provider.dart';
import 'package:project_for_all/main.dart';
import 'package:project_for_all/models/requests_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/theme/app_size.dart';
import '../../../../../../config/theme/colors_theme.dart';

class AddOrderFloatingBotton extends StatelessWidget {
  const AddOrderFloatingBotton({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    Future<void> addRequest() async {
      try {
        final watchOrder =
            Provider.of<AddOrderProvider>(context, listen: false);
        final requestProvider =
            Provider.of<FirebaseRequestProvider>(context, listen: false);
        final user = FirebaseAuth.instance.currentUser;
        var random = Random().nextDouble() * 535.59;
        RequestsModel newRequest = RequestsModel(
          requestId: random.toString(),
          clientId: user!.uid,
          workerId: requestProvider.workerId,
          location: sharedPref.getString('location'),
          serviceType: watchOrder.selectedCategoryCardName,
          workDescription: watchOrder.workDescriptionController.text,
          status: 'PENDING',
          timeStamp:
              'date:${watchOrder.selectedDateAndDay} at ${watchOrder.selectedTime}',
        );
        return requestProvider.addRequest(newRequest);
      } catch (e) {
        print(e);
      }
    }

    return Container(
      height: AppSize.height(context) * 0.07, // Set the height of the FAB
      width: AppSize.width(context) * 0.9,
      margin: EdgeInsets.only(
          bottom: AppSize.height(context) * 0.05), // Set the width of the FAB
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        splashColor: ColorsTheme().primary.withOpacity(0.8),
        backgroundColor: ColorsTheme().primary,
        onPressed: () async {
          await addRequest().then(
            (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('request send successfully'),
                ),
              );
              context.read<AddOrderProvider>().selectedCategoryCardName = '';
              context.read<AddOrderProvider>().selectedDateAndDay = '';
              context.read<AddOrderProvider>().workDescriptionController.text =
                  '';
              context.read<AddOrderProvider>().selectedTime = '';
              Navigator.of(context).pushNamedAndRemoveUntil(
                'user home screen',
                (route) => false,
              );
            },
          );
        }, // Define the onPressed event
        child: Text(
          "Make Order",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ), // Add an icon
      ),
    );
  }
}
