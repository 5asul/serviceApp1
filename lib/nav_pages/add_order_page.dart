import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/controller/database/sqfLite.dart';

import '../config/theme/colors_theme.dart';
import '../controller/componentAPI/crud_mysql_api.dart';
import '../features/screens/user_home_screens/home_navigation_bar.dart';
import '../main.dart';

class AddOrder extends StatefulWidget {
  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> with Crud {


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
  String dateTime = DateTime.now().toString();

  DateTime _selectDataTime = DateTime.now();
  void _chooseDataTime() async {
    final result = await showBoardDateTimePicker(
        onChanged: (result) {
          dateTime = result.toString();
        },
        context: context,
        pickerType: DateTimePickerType.datetime,
        initialDate: _selectDataTime,
        options: BoardDateTimeOptions(
          languages: BoardPickerLanguages(
              today: 'Today', tomorrow: 'Tomorrow', now: 'now'),
          startDayOfWeek: DateTime.saturday,
          pickerFormat: PickerFormat.ymd,
          activeColor: Colors.green.shade200,
          backgroundDecoration: BoxDecoration(
            color: Colors.white,
          ),
        ));
    if (result != null) {
      setState(() {
        _selectDataTime = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
              child: Column(
            children: [
              Container(
                width: 380.0,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: "Select the service",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  value: svalue,
                  items: [
                    DropdownMenuItem(
                      child: Text("Select the srevice..."),
                      value: "-1",
                    ),
                    DropdownMenuItem(
                      child: Text("elctric"),
                      value: "1",
                    ),
                    DropdownMenuItem(
                      child: Text("plumber"),
                      value: "2",
                    ),
                    DropdownMenuItem(
                      child: Text("assistant"),
                      value: "3",
                    ),
                    DropdownMenuItem(
                      child: Text("homemade"),
                      value: "4",
                    )
                  ],
                  onChanged: (value) {
                    selectedService = value!;
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () {
                  _chooseDataTime();
                },
                child: Container(
                  width: 380.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                      color: ColorsTheme().secondary,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(
                        color: Colors.black54,
                        width: 1.0,
                      )),
                  child: Center(
                    child: Text(
                      "${_selectDataTime}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                width: 150.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: ColorsTheme().primary,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: MaterialButton(
                    onPressed: () async {
                      if (selectedService == null) {
                        selectedService = "electric";
                      } else if (selectedService == "1") {
                        selectedService = "electric";
                      } else if (selectedService == "2") {
                        selectedService = "plumber";
                      } else if (selectedService == "3") {
                        selectedService = "assistant";
                      } else if (selectedService == "4") {
                        selectedService = "homemade";
                      }
                      await addService();
                    },
                    child: Text("Add Service",
                        style: TextStyle(color: Colors.white))),
              )
            ],
          )),
        ),
      ),
    );
  }
}
