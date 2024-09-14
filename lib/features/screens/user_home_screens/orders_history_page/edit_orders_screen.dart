// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:project_for_all/controller/database/sqfLite.dart';

import '../../../../../config/theme/app_size.dart';
import '../../../../../controller/componentAPI/crud_mysql_api.dart';
import '../home_page/add_order_screen/add_order_widgets/add_order_app_bar.dart';
import '../home_page/add_order_screen/add_order_widgets/add_order_category_cards.dart';
import '../home_page/add_order_screen/add_order_widgets/payment_section.dart';
import '../home_page/add_order_screen/add_order_widgets/set_date_and_time_section/set_date_and_time_section.dart';
import '../home_page/add_order_screen/add_order_widgets/work_description_section.dart';
import 'orders_history_widgets/edit_order-floating_botton.dart';


class EditOrdersScreen extends StatefulWidget {
  @override
  State<EditOrdersScreen> createState() => _EditOrdersScreenState();
}

class _EditOrdersScreenState extends State<EditOrdersScreen> with Crud {
  DatabaseHelper sqlDb = DatabaseHelper();
  

  // for dropdown feild
  String? selectedService;
  String? svalue = "-1";
  // datetime picker function

  

  @override
  Widget build(BuildContext context) {
    
    
    var screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: EditOrderFloatingBotton(screenSize: screenSize),
      appBar: AddOrderAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: AppSize.height(context) * 0.15),
          child: Column(
            children: [
              AddOrderCategoryCards(),
              SetDateAndTimeSection(),
              SizedBox(
                height: AppSize.height(context) * 0.05,
              ),
              WorkDescriptionSection(),
              SizedBox(
                height: AppSize.height(context) * 0.05,
              ),
              PaymentSection(),
            ],
          ),
        ),
      ),
    );
  }
}




