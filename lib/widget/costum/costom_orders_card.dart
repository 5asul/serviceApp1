import 'package:flutter/material.dart';

import '../../containers/home_container_page.dart';

class OrdersCard extends StatelessWidget {
  const OrdersCard({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.02,
          vertical: screenSize.height * 0.02),
      margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: primary)),
      child: Column(
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
                        'teach my children afternoon',
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
                            color: primary,
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
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: screenSize.height * 0.01),
                    width: screenSize.width * 0.48,
                    height: screenSize.height * 0.0008,
                    decoration: BoxDecoration(
                      color: primary,
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
                              'Teaching',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: screenSize.width * 0.03,
                                color: primary,
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
                            width: screenSize.width * 0.2,
                          ),
                          Container(
                            width: screenSize.width * 0.2,
                            child: Text(
                              'Wed,27 Nov 2024',
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: screenSize.width * 0.03,
                                color: primary,
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
            color: primary,
            height: screenSize.height * 0.02,
            thickness: screenSize.width * 0.0015,
            indent: screenSize.width * 0.05,
            endIndent: screenSize.width * 0.05,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: screenSize.width * 0.015,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: MaterialButton(
                      minWidth: screenSize.width * 0.3,
                      height: screenSize.height * 0.045,
                      onPressed: () {},
                      color:
                          primary, //(widget.state=='PENDING')?Colors.amberAccent:(widget.state=='COMPLETED')?
                      // Colors.green:Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "On Going",
                        style: TextStyle(
                          fontSize: screenSize.width * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.05,
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
                          fontSize: screenSize.width * 0.08,
                          fontWeight: FontWeight.bold,
                          color: primary,
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
        ],
      ),
    );
  }
}