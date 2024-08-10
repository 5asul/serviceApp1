import 'dart:ffi';

import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_for_all/constent/linkapi.dart';
import 'package:project_for_all/widget/costum/dropDowns.dart';
import 'package:project_for_all/controller/database/sqfLite.dart';
import 'package:intl/intl.dart';
import '../controller/componentAPI/crud_mysql_api.dart';
import '../containers/home_container_page.dart';
import '../widget/costum/costom_category_card.dart';
import '../main.dart';

class AddOrderScreen extends StatefulWidget {
  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> with Crud {
  DatabaseHelper sqlDb = DatabaseHelper();

  Future<void> addService() async {
    print("${selectedService}///${dateTime}///${sharedPref.getString('id')}");
    try {
      int response = await sqlDb.insertData(
          "INSERT INTO 'services' ('service_name', 'time', 'user_id') VALUES ('${selectedService}', '${dateTime}', '${sharedPref.getString('id')}')");
      if (response > 0) {
        print("inserted....");
      } else {
        // Handle signup failure gracefully (e.g., display an error message)
        print("service insert failed"); // Assuming 'message' is in response
      }
    } catch (error) {
      print("service insert Error: $error"); // Log for debugging
      // Display an error message to the user
    }
  }

  // for dropdown feild
  String? selectedService;
  String? svalue = "-1";
  // datetime picker function

  int getDateNumberFromDayName(String dayName) {
    // Get the current date
    DateTime now = DateTime.now();

    // Find the first day of the current week (Monday)
    DateTime firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));

    // Map day names to their respective weekday numbers
    Map<String, int> dayNameToNumber = {
      'Monday': 1,
      'Tuesday': 2,
      'Wednesday': 3,
      'Thursday': 4,
      'Friday': 5,
      'Saturday': 6,
      'Sunday': 7,
    };

    // Get the weekday number for the provided day name
    int? dayNumber = dayNameToNumber[dayName];

    if (dayNumber == null) {
      throw ArgumentError('Invalid day name: $dayName');
    }

    // Calculate the date for the given day name
    DateTime targetDate = firstDayOfWeek.add(Duration(days: dayNumber - 1));
    daynum = targetDate.day.toString();
    // Return the day of the month
    return targetDate.day;
  }

  String year = DateFormat('y').format(DateTime.now()).toString();
  String day = DateFormat('EEEE').format(DateTime.now()).toString();
  String month = DateFormat('MMMM').format(DateTime.now()).toString();
  late String daynum = "10";
  DateTime now = DateTime.now();
  String dateTime = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: screenSize.height * 0.07, // Set the height of the FAB
        width: screenSize.width * 0.9,
        margin: EdgeInsets.only(
            bottom: screenSize.height * 0.05), // Set the width of the FAB
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          splashColor: primary.withOpacity(0.8),
          backgroundColor: primary,
          onPressed: () {
            Navigator.of(context).pushNamed('add order1');
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
      ),
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text('Order service'),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                sharedPref.clear();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("login", (route) => false);
              },
            )
          ]),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.055, right: screenWidth * 0.055),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: screenSize.height * 0.25,
                child: Row(
                  children: [
                    CategoryCard(
                        name: "Cleaning",
                        workerNumber: "+460 workers",
                        icon: Icons.cleaning_services),
                    CategoryCard(
                        name: "Teaching",
                        workerNumber: "+300 workers",
                        icon: Icons.book_rounded),
                    CategoryCard(
                        name: "Cleaning",
                        workerNumber: "+460 workers",
                        icon: Icons.dry_cleaning),
                    CategoryCard(
                        name: "Cleaning",
                        workerNumber: "+460 workers",
                        icon: Icons.dry_cleaning),
                    CategoryCard(
                        name: "Cleaning",
                        workerNumber: "+460 workers",
                        icon: Icons.dry_cleaning)
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.06,
              bottom: screenHeight * 0.005,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Text(
                  "Set date & time",
                  style: TextStyle(
                    fontSize: screenSize.width * 0.03,
                    fontWeight: FontWeight.bold,
                    color: primary.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              width: screenSize.width * 0.9,
              height: screenSize.height * 0.19,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: primary.withOpacity(0.3), // Shadow color
                      spreadRadius: 0, // Spread radius
                      blurRadius: 10, // Blur radius
                      offset: Offset(0, 5), // Offset in the x and y direction
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: primary)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            month,
                            style: TextStyle(
                              fontSize: screenSize.width * 0.045,
                              fontWeight: FontWeight.bold,
                              color: primary,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            year,
                            style: TextStyle(
                              fontSize: screenSize.width * 0.045,
                              fontWeight: FontWeight.bold,
                              color: primary,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: screenWidth * 0.030),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: screenHeight * 0.005),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  child: Text(
                                    "Sat",
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.035,
                                      fontWeight: FontWeight.bold,
                                      color: primary.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20.0,
                              foregroundColor: primary,
                              child: IconButton(
                                icon: Text(
                                  daynum,
                                  style: TextStyle(
                                    fontSize: screenSize.width * 0.035,
                                    color: primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  getDateNumberFromDayName("Saturday");
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: screenWidth * 0.030),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: screenHeight * 0.005),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  child: Text(
                                    "Sun",
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.035,
                                      fontWeight: FontWeight.bold,
                                      color: primary.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20.0,
                              backgroundColor: primary,
                              child: IconButton(
                                icon: Text(
                                  daynum,
                                  style: TextStyle(
                                    fontSize: screenSize.width * 0.035,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  daynum = getDateNumberFromDayName("Sunday")
                                      .toString();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: screenWidth * 0.030),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: screenHeight * 0.005),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  child: Text(
                                    "Mon",
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.035,
                                      fontWeight: FontWeight.bold,
                                      color: primary.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20.0,
                              backgroundColor: primary,
                              child: IconButton(
                                icon: Text(
                                  daynum,
                                  style: TextStyle(
                                    fontSize: screenSize.width * 0.035,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  getDateNumberFromDayName("Saturday");
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: screenWidth * 0.030),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: screenHeight * 0.005),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  child: Text(
                                    "Tus",
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.035,
                                      fontWeight: FontWeight.bold,
                                      color: primary.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20.0,
                              backgroundColor: primary,
                              child: IconButton(
                                icon: Text(
                                  daynum,
                                  style: TextStyle(
                                    fontSize: screenSize.width * 0.035,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  getDateNumberFromDayName("Saturday");
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: screenWidth * 0.030),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: screenHeight * 0.005),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  child: Text(
                                    "Thu",
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.035,
                                      fontWeight: FontWeight.bold,
                                      color: primary.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20.0,
                              backgroundColor: primary,
                              child: IconButton(
                                icon: Text(
                                  daynum,
                                  style: TextStyle(
                                    fontSize: screenSize.width * 0.035,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  getDateNumberFromDayName("Saturday");
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: screenWidth * 0.030),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: screenHeight * 0.005),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  child: Text(
                                    "Fri",
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.035,
                                      fontWeight: FontWeight.bold,
                                      color: primary.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20.0,
                              backgroundColor: primary,
                              child: IconButton(
                                icon: Text(
                                  daynum,
                                  style: TextStyle(
                                    fontSize: screenSize.width * 0.035,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  getDateNumberFromDayName("Saturday");
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.055, right: screenWidth * 0.055),
            child: Container(
              width: screenSize.width * 0.9,
              height: screenSize.height * 0.08,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: primary)),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.018),
                    child: Container(
                        padding: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            color: primary.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10.0),
                            border:
                                Border.all(color: primary.withOpacity(0.8))),
                        child: Text(
                          "Morning",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.018),
                    child: Container(
                        padding: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          //color: primary.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10.0),
                          //border: Border.all(color: primary )
                        ),
                        child: Text(
                          "Afternoon",
                          style: TextStyle(
                              color: primary,
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.018),
                    child: Container(
                        padding: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          //color: primary.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10.0),
                          // border: Border.all(color: primary )
                        ),
                        child: Text(
                          "Evening",
                          style: TextStyle(
                              color: primary,
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.018),
                    child: Container(
                        padding: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          //color: primary.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10.0),
                          //border: Border.all(color: primary )
                        ),
                        child: Text(
                          "Night",
                          style: TextStyle(
                              color: primary,
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.018),
                    child: Container(
                        padding: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          //color: primary.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10.0),
                          //border: Border.all(color: primary )
                        ),
                        child: Text(
                          "Late Night",
                          style: TextStyle(
                              color: primary,
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.055, right: screenWidth * 0.055),
            child: Container(
              padding: EdgeInsets.only(left: screenWidth * 0.030),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.002),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Text(
                          "Payment",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: primary.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                        vertical: screenHeight * 0.005),
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.08,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: primary)),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Credit Card",
                              style: TextStyle(
                                  color: primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "**** **** **** 4825",
                              style: TextStyle(
                                  color: primary.withOpacity(0.8),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Image.asset(
                          'assets/images/Mastercard.png',
                          width: screenSize.width * 0.15,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
