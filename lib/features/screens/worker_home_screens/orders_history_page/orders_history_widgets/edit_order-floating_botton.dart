import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_request_provider.dart';
import 'package:project_for_all/features/state_managment/provider/add_order_provider.dart';
import 'package:project_for_all/main.dart';
import 'package:project_for_all/models/requests_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/theme/app_size.dart';
import '../../../../../../config/theme/colors_theme.dart';

class EditOrderFloatingBotton extends StatelessWidget {
  const EditOrderFloatingBotton({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    Future<void> updateRequest() async {
      try {
        final watchOrder =
            Provider.of<AddOrderProvider>(context, listen: false);
        final requestProvider =
            Provider.of<FirebaseRequestProvider>(context, listen: false);
        final user = FirebaseAuth.instance.currentUser;

        RequestsModel newRequest = RequestsModel(
          docid: watchOrder.requestModel.docid,
          requestId: watchOrder.requestId,
          clientId: watchOrder.requestModel.clientId,
          workerId: watchOrder.requestModel.workerId,
          location: watchOrder.requestModel.location,
          serviceType: watchOrder.selectedCategoryCardName,
          workDescription: watchOrder.workDescriptionController.text,
          status: watchOrder.state,
          timeStamp:
              'date:${watchOrder.selectedDateAndDay} at ${watchOrder.selectedTime}',
        );
        return requestProvider.updateRequest(newRequest);
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
          await updateRequest().then(
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
              Navigator.pop(context); // Navigate back to the previous screen
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
