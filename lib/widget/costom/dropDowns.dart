import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';

import '../../config/theme/colors_theme.dart';




class DropdownService extends StatefulWidget {



 const DropdownService({super.key, });

  @override
  State<DropdownService> createState() => _DropdownServiceState();
}

class _DropdownServiceState extends State<DropdownService> {
  var svalue="-1";

  late String selected ;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ], onChanged: (value) {
          selected = value!;
      },

      ),
    );
  }
}


//times drop down

class TimeDropdown extends StatefulWidget {
  const TimeDropdown({super.key});

  @override
  State<TimeDropdown> createState() => _TimeDropdownState();
}

class _TimeDropdownState extends State<TimeDropdown> {
  DateTime _selectDataTime =DateTime.now();

  void _chooseDataTime() async {
    final result = await showBoardDateTimePicker(
        onChanged: (result){

        },
        context: context,
        pickerType: DateTimePickerType.datetime,
        initialDate: _selectDataTime,
        options: BoardDateTimeOptions(
          languages: BoardPickerLanguages(
            today: 'Today',
            tomorrow: 'Tomorrow',
            now: 'now'
          ),
          startDayOfWeek: DateTime.saturday,
          pickerFormat: PickerFormat.ymd,
          activeColor: Colors.green.shade200,
          backgroundDecoration: BoxDecoration(
            color: Colors.white,

          ),
    )
    );
    if (result!=null) {
      setState(() {
        _selectDataTime = result;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ( ){
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
          )
        ),
        child: Center(
          child: Text("${_selectDataTime}",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,

          ),


          ),
        ),
      ),
    ) ;
  }
}




