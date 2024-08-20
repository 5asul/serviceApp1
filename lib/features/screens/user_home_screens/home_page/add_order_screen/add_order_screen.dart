// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:project_for_all/controller/database/sqfLite.dart';

import '../../../../../controller/componentAPI/crud_mysql_api.dart';
import 'add_order_widgets/add_order-floating_botton.dart';
import 'add_order_widgets/add_order_app_bar.dart';
import 'add_order_widgets/add_order_category_cards.dart';
import 'add_order_widgets/payment_section.dart';
import 'add_order_widgets/set_date_and_time_section/set_date_and_time_section.dart';
import 'add_order_widgets/work_description_section.dart';

class AddOrderScreen extends StatefulWidget {
  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> with Crud {
  DatabaseHelper sqlDb = DatabaseHelper();
  

  // for dropdown feild
  String? selectedService;
  String? svalue = "-1";
  // datetime picker function

  

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AddOrderFloatingBotton(screenSize: screenSize),
      appBar: AddOrderAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: screenHeight * 0.15),
          child: Column(
            children: [
              AddOrderCategoryCards(
                  screenWidth: screenWidth, screenSize: screenSize),
              SetDateAndTimeSection(),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              WorkDescriptionSection(),
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              PaymentSection(screenWidth: screenWidth, screenHeight: screenHeight, screenSize: screenSize),
            ],
          ),
        ),
      ),
    );
  }
}




