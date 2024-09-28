import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';

import '../../../../../../config/theme/colors_theme.dart';

class WorkerCard extends StatelessWidget {
  final String name;
  final String numberOfOrders;
  final String image;
  final String rank;
  final IconData icon;
  const WorkerCard(
      {super.key,
      required this.name,
      required this.numberOfOrders,
      required this.image,
      required this.rank,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isHovered = false;
    return InkWell(
      onTap: () {},
      child: Container(
        width: screenSize.width * 1.0,
        height: screenSize.height * 0.2,
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Stack(
          children: [
            Card(
              elevation: 5,
              child: Container(
                width: AppSize.width(context) * 1.0,
                height: AppSize.height(context) * 0.15,
                decoration: BoxDecoration(
                  color: ColorsTheme().background,
                  border: Border.all(color: ColorsTheme().primary),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(AppSize.width(context) * 0.02),
                      width: AppSize.width(context) * 0.3,
                      height: AppSize.height(context) * 0.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppSize.width(context) * 0.05),
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/teacher.jpg",
                              ),
                              fit: BoxFit.cover)),

                      // Add your child widgets here
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: AppSize.height(context) * 0.01),
                          width: AppSize.width(context) * 0.5,
                          height: AppSize.height(context) * 0.045,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Ahmed Mubarak',
                              style: TextStyle(
                                  color: ColorsTheme().primary,
                                  fontSize: AppSize.width(context) * 0.05,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: screenSize.height * 0.03,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      screenSize.width * 0.015),
                                  color: ColorsTheme().primary),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: AppSize.width(context) * 0.015,
                                      right: AppSize.width(context) * 0.015),
                                  child: Text(
                                    "Teacher",
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.03,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: screenSize.width * 0.02,
                                        right: screenSize.width * 0.015),
                                    child: Icon(
                                      Icons.location_pin,
                                      size: screenSize.width * 0.07,
                                      color: ColorsTheme().primary,
                                    ),
                                  ),
                                  Container(
                                    width: screenSize.width * 0.3,
                                    child: Text(
                                      "679 Eagle Crest Alley",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: screenSize.width * 0.035,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSize.height(context) * 0.005),
                              child: Text(
                                "\$27",
                                style: TextStyle(
                                  fontSize: AppSize.width(context) * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsTheme().primary,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: AppSize.width(context) * 0.01),
                              child: Text(
                                '(Floor price)',
                                style: TextStyle(
                                  fontSize: AppSize.width(context) * 0.04,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: AppSize.height(context) * 0.0001,
              left: AppSize.width(context) * 0.79,
              child: Container(
                width: AppSize.width(context) * 0.18,
                height: AppSize.height(context) * 0.032,
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(context) * 0.015),
                decoration: BoxDecoration(
                  color: ColorsTheme().background,
                  borderRadius:
                      BorderRadius.circular(AppSize.width(context) * 0.02),
                ),
                child: Row(
                  children: [
                    Text(
                      rank,
                      style: TextStyle(
                          color: ColorsTheme().primary,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 2.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
