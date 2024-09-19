import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_request_provider.dart';
import 'package:project_for_all/features/screens/worker_home_screens/orders_history_page/orders_history_widgets/status_button.dart';
import 'package:provider/provider.dart';

import '../../../../../config/theme/colors_theme.dart';

class WorkerOrdersCard extends StatelessWidget {
  const WorkerOrdersCard({
    super.key,
    required this.screenSize,
    required this.workDescription,
    required this.location,
    required this.serviceType,
    required this.date,
    required this.status,
    required this.selectedCardId,
    required this.cancel,
    required this.update,
    required this.idIsEqual,
  });

  final Size screenSize;
  final String workDescription;
  final String location;
  final String serviceType;
  final String date;
  final String status;
  final bool idIsEqual;
  final Future<void> Function() update;
  final void Function() cancel;
  final Future<void> Function() selectedCardId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cancel,
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.02,
              vertical: screenSize.height * 0.02),
          margin: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05,
              vertical: screenSize.height * 0.02),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: ColorsTheme().primary)),
          child: Consumer<FirebaseRequestProvider>(
            builder: (context, requestData, _) {
              final request = requestData.requests[0];
              final requestProvider =
                  Provider.of<FirebaseRequestProvider>(context, listen: false);
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenSize.width * 0.3,
                        height: screenSize.height * 0.2,
                        margin: EdgeInsets.only(right: screenSize.width * 0.02),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('assets/teacher.jpg'),
                                fit: BoxFit.cover,
                                alignment: Alignment(1, -0.6))),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: screenSize.width * 0.5,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '$workDescription',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: screenSize.width * 0.05,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.location_pin,
                                    size: screenSize.width * 0.07,
                                    color: ColorsTheme().primary,
                                  ),
                                ),
                                Container(
                                  width: screenSize.width * 0.3,
                                  child: Text(
                                    "$location",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.035,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                                Container(
                                  
                                  child: IconButton(
                                    
                                    onPressed: () {
                                      Navigator.of(context).pushNamed('chat with worker screen');
                                    },
                                    icon:Icon(Icons.chat,
                                    size: screenSize.width * 0.07,
                                    color: ColorsTheme().primary,),
                                    
                                    
                                  ),)
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: screenSize.height * 0.01),
                            width: screenSize.width * 0.48,
                            height: screenSize.height * 0.0008,
                            decoration: BoxDecoration(
                              color: ColorsTheme().primary,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      'Service:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: screenSize.width * 0.04,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.2,
                                  ),
                                  Container(
                                    child: Text(
                                      '$serviceType',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: screenSize.width * 0.03,
                                        color: ColorsTheme().primary,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      'Date:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: screenSize.width * 0.04,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.1,
                                  ),
                                  Container(
                                    width: screenSize.width * 0.29,
                                    child: Text(
                                      '$date',
                                      textAlign: TextAlign.left,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: screenSize.width * 0.03,
                                        color: ColorsTheme().primary,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: ColorsTheme().primary,
                    height: screenSize.height * 0.02,
                    thickness: screenSize.width * 0.0015,
                    indent: screenSize.width * 0.05,
                    endIndent: screenSize.width * 0.05,
                  ),
                  Row(
                    children: [
                      StatusBottun(
                        screenSize: screenSize,
                        status: 'On Going',
                        isSelected: requestProvider.selectedStatusButton ==
                                'On Going' &&
                            idIsEqual,
                        selectedStatusButton: () async {
                          requestProvider.selectedStatusButton = 'On Going';
                          await selectedCardId().then((value) {
                            log('${requestProvider.selectedCardId}');
                            log('${requestProvider.selectedStatusButton}');
                          });
                          await update();
                        },
                      ),
                      StatusBottun(
                        screenSize: screenSize,
                        status: 'COMPLETED',
                        isSelected: requestProvider.selectedStatusButton ==
                                'COMPLETED' &&
                            idIsEqual,
                        selectedStatusButton: () async {
                          requestProvider.selectedStatusButton = 'COMPLETED';
                          await selectedCardId().then((value) {
                            log('${requestProvider.selectedCardId}');
                            log('${requestProvider.selectedStatusButton}');
                          });
                          await update();
                        },
                      ),
                      StatusBottun(
                        screenSize: screenSize,
                        status: 'CANCELED',
                        isSelected: requestProvider.selectedStatusButton ==
                                'CANCELED' &&
                            idIsEqual,
                        selectedStatusButton: () async {
                          requestProvider.selectedStatusButton = 'CANCELED';
                          await selectedCardId().then((value) {
                            log('${requestProvider.selectedCardId}');
                            log('${requestProvider.selectedStatusButton}');
                          });
                          await update();
                        },
                      ),
                    ],
                  )
                ],
              );
            },
          )),
    );
  }
}
