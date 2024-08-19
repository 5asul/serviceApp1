import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';
import 'package:project_for_all/features/screens/user_home_screens/home_navigation_bar.dart';
import 'package:project_for_all/models/worker_work_image.dart';
import 'package:project_for_all/widget/costom/costom_review_card.dart';

import '../../../../widget/costom/costom_worker_profile_card.dart';

class WorkerProfileScreen extends StatefulWidget {
  const WorkerProfileScreen({super.key});

  @override
  State<WorkerProfileScreen> createState() => _WorkerProfileScreenState();
}

class _WorkerProfileScreenState extends State<WorkerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: screenSize.height * 0.07, // Set the height of the FAB
        width: screenSize.width * 1.0,
        margin: EdgeInsets.only(bottom: 15.0), // Set the width of the FAB
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenSize.width * 0.3,
              margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.01),
              child: FloatingActionButton(
                splashColor: ColorsTheme().primary,
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushNamed('add order1');
                }, // Define the onPressed event
                child: Text(
                  "Book Now",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: ColorsTheme().primary,
                  ),
                ), // Add an icon
              ),
            ),
            Container(
              width: screenSize.width * 0.3,
              margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.01),
              child: FloatingActionButton(
                splashColor: ColorsTheme().primary,
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushNamed('add order1');
                }, // Define the onPressed event
                child: Text(
                  "Message",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: ColorsTheme().primary,
                  ),
                ), // Add an icon
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: screenSize.height*0.1),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                color: Colors.grey.shade300,
                child: WorkerProfileCard(
                    name: "Ahmed",
                    numberOfOrders: "10",
                    image: "assets/teacher.jpg",
                    rank: "5.0",
                    icon: Icons.book_rounded),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.05,
                    vertical:screenSize.height*0.02),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
        
                          height: screenSize.height * 0.04,
                          margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.01),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(screenSize.width * 0.015),
                            color: ColorsTheme().primary
        
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: screenSize.width*0.02,
                                  right: screenSize.width*0.02),
                              child: Text(
                                "Teacher",
                                style: TextStyle(
                                  fontSize: screenSize.width * 0.04,
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
                                margin: EdgeInsets.only(left: screenSize.width*0.02,
                                right: screenSize.width*0.015),
                                child: Icon(
                                  Icons.location_pin,
                                  size: screenSize.width * 0.07,
                                  color: ColorsTheme().primary,
                                ),
                              ),
                              Container(
                                width: screenSize.width*0.3,
                                child: Text(
                                    "679 Eagle Crest Alley",
                                  overflow:TextOverflow.ellipsis ,
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.02,
                            vertical: screenSize.height*0.02),
                            child: Text(
                              "\$27",
                              style: TextStyle(
                                fontSize: screenSize.width * 0.08,
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
                    ),
                    Divider(
                      color: Colors.grey,
                      height: screenSize.height*0.04,
                      thickness: screenSize.width*0.0015,
                      indent: screenSize.width*0.05,
                      endIndent: screenSize.width*0.05,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.02,),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'About me',
                              style: TextStyle(
                                fontSize: screenSize.width * 0.06,
                                fontWeight: FontWeight.bold,
                                color: ColorsTheme().primary,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                                  'sed do eiusmod tempor incididunt ut labore et dolore magna '
                                  'aliqua. Ut enim ad minim veniam, quis nostrud exercitation'
                                  ' ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                                  'Duis aute irure dolor in reprehenderit in voluptate velit '
                                  'esse cillum dolore eu fugiat nulla pariatur. Excepteur sint'
                                  ' occaecat cupidatat non proident, sunt in culpa qui officia '
                                  'deserunt mollit anim id est laborum.',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                color: Colors.grey.shade700
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.02,
                      vertical: screenSize.height*0.02),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Photos & Videos',
                              style: TextStyle(
                                fontSize: screenSize.width * 0.06,
                                fontWeight: FontWeight.bold,
                                color: ColorsTheme().primary,
                              ),
                            ),
                          ),
                          Container(
                            width: screenSize.width*0.8,
                            height: screenSize.height*0.3,
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // Number of columns
                                crossAxisSpacing: 10.0, // Space between columns
                                mainAxisSpacing: 10.0, // Space between rows
                              ),
                              itemCount: WorkerLists.imagesPaths.length,
                              itemBuilder: (context, index) {
                                return Image.asset("${WorkerLists.imagesPaths[index]}");
                              },
                            )
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      height: screenSize.height*0.04,
                      thickness: screenSize.width*0.0015,
                      indent: screenSize.width*0.05,
                      endIndent: screenSize.width*0.05,
                    ),
                    ReviewCard(screenSize: screenSize)
        
                  ],
                ),
              ),

        
            ],
          ),
        ),
      ),
    );
  }
}


