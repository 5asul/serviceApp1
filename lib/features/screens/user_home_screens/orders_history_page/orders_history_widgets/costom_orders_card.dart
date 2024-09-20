// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_request_provider.dart';
import 'package:project_for_all/features/screens/user_home_screens/home_page/category_screen/worker_profile_screen/chat_with_worker_screen.dart';
import 'package:project_for_all/models/requests_model.dart';
import 'package:provider/provider.dart';

import '../../../../../config/theme/colors_theme.dart';
import 'costom_orders_card_widgets/add_review_bottom_sheet.dart';
import 'costom_orders_card_widgets/add_review_bottun.dart';
import 'costom_orders_card_widgets/statuse_bottun.dart';

class OrdersCard extends StatelessWidget {
  const OrdersCard({
    super.key,
    required this.screenSize,
    required this.workDescription,
    required this.location,
    required this.serviceType,
    required this.date,
    required this.status,
    required this.update,
    required this.delete,
    required this.isSelected,
    required this.selectedStatusButton,
    required this.cancel,
    required this.requestsModel,
  });
  final RequestsModel requestsModel;
  final Size screenSize;
  final String workDescription;
  final String location;
  final String serviceType;
  final String date;
  final String status;
  final bool isSelected;
  final void Function() cancel;
  final void Function() selectedStatusButton;
  final void Function() update;
  final void Function() delete;

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
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => MessageScreen(
                                          requestsModel: requestsModel,
                                        ),
                                      ));
                                      // .pushNamed('chat with worker screen');
                                    },
                                    icon: Icon(
                                      Icons.chat,
                                      size: screenSize.width * 0.07,
                                      color: ColorsTheme().primary,
                                    ),
                                  ),
                                )
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
                  Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        OrdersStatusBottun(
                            screenSize: screenSize,
                            selectedStatusButton: selectedStatusButton,
                            status: status,
                            isSelected: isSelected,
                            delete: delete,
                            update: update),
                        SizedBox(
                          width: screenSize.width * 0.035,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: screenSize.width * 0.02,
                              ),
                              child: Text(
                                "\$27",
                                style: TextStyle(
                                  fontSize: screenSize.width * 0.07,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsTheme().primary,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                '(Floor price)',
                                style: TextStyle(
                                  fontSize: screenSize.width * 0.05,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      AddReviewBottun(
                          screenSize: screenSize,
                          addReviewBottomSheet: () async {
                            await AddReviewBottomSheet().showModelBottomSheet(
                              context,
                            );
                          }),
                      SizedBox(
                        width: screenSize.width * 0.035,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: AppSize.width(context) * 0.07,
                          ),
                          SizedBox(
                            width: AppSize.width(context) * 0.02,
                          ),
                          Container(
                            width: AppSize.width(context) * 0.40,
                            child: Text(
                              "${4.9} | (4,263 reviews)",
                              maxLines: 1,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.grey.shade600,
                                fontSize: screenSize.width * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
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
