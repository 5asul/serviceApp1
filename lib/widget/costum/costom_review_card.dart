import 'package:flutter/material.dart';
import 'package:project_for_all/containers/home_container_page.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.03,
      vertical: screenSize.height*0.02),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.star,
                    color: Colors.yellow,),
                  SizedBox(width: screenSize.width*0.02,),
                  Text(
                    "5.0 (4,263 reviews)",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: screenSize.width*0.04,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(width: screenSize.width*0.2),
              Container(
                child: Text(
                  'See All',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primary
                      ),
                ),
              )
            ],
          ),
          SizedBox(height: screenSize.height*0.01,),
          Container(
            padding: EdgeInsets.only(left: screenSize.width*0.02,
            right: screenSize.width*0.02,
            bottom: screenSize.height*0.01,
            top: screenSize.width*0.015),
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10), // Optional: for rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 0.5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: Offset(0, 5), // Shadow position
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: screenSize.height*0.02),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: screenSize.width*0.06,
                        backgroundImage: AssetImage('assets/teacher.jpg'),
                      ),
                      SizedBox(width: screenSize.width*0.05,),
                      Text(
                        'John Doe',
                        style: TextStyle(
                            fontSize: screenSize.width*0.045,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600),
                      ),
                      SizedBox(width: screenSize.width*0.25),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.03),
                        width: screenSize.width*0.15,
                        height: screenSize.height*0.04,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(screenSize.width*0.06),
                            border: Border.all(color: primary)
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star,color: primary,
                              size: screenSize.width*0.04,),
                            Container(
                              margin: EdgeInsets.only(left: screenSize.width*0.01),
                              child: Text(
                                '5',
                                style: TextStyle(
                                    color: primary
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
    
                    ],
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Address: 123 Main St, City, State, Zip',
                      style: TextStyle(
                          color: Colors.grey.shade700
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: (){

                        },
                        icon: Icon(
                            Icons.favorite_border
                        )),
                    Container(
                      child: Text(
                        '200',
                        style: TextStyle(
                            color: Colors.grey.shade700
                        ),
                      ),
                    ),
                    SizedBox(width: screenSize.width*0.05,),
                    Container(
                      child: Text(
                        '3 weeks ago',
                        style: TextStyle(
                            color: Colors.grey.shade700
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
    
        ],
      ),
    );
  }
}