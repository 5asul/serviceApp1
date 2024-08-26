import 'package:flutter/material.dart';
import 'package:project_for_all/main.dart';

import '../../../../../config/theme/app_size.dart';
import '../../../../../config/theme/colors_theme.dart';

class LocationDropDown extends StatelessWidget {
  const LocationDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? selectedService;
    String? svalue = "-1";
    return Container(
      width: AppSize.width(context)*1.0,
      child: DropdownButtonFormField(
        style: TextStyle(

            fontWeight: FontWeight.bold,
            fontSize: AppSize.width(context) * 0.04),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsTheme().primary)
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: "Select the service",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        value: svalue,
        items: [
          DropdownMenuItem(
            child: Text(
              "Select your location...",
              style: TextStyle(
                color: Colors.grey.shade700
              ),
            ),
            value: "-1",
          ),
          DropdownMenuItem(
            child: Text(
              "- Haddah",
              style: TextStyle(
                color: ColorsTheme().primary,
              ),
            ),
            value: "0",
          ),
          DropdownMenuItem(
            child: Text(
              "- AL-Asbhi",
              style: TextStyle(
                color: ColorsTheme().primary,
              ),
            ),
            value: "1",
          ),
          DropdownMenuItem(
            child: Text(
              "- Al-Safiah",
              style: TextStyle(
                color: ColorsTheme().primary,
              ),
            ),
            value: "2",
          ),
          DropdownMenuItem(
            child: Text(
              "- Bab Al-Yemen",
              style: TextStyle(
                color: ColorsTheme().primary,
              ),
            ),
            value: "3",
          )
        ],
        onChanged: (value) {
          selectedService = value!;
          (value=='0')?sharedPref.setString('location', location[0]):(value=='1')?sharedPref.setString('location', location[1])
          :(value=='2')?sharedPref.setString('location', location[2]):sharedPref.setString('location', location[3]);
        },
      ),
    );
  }
}

List<String> location = [
  "Haddah",
  "AL-Asbhi",
  "Al-Safiah",
  "Bab Al-Yemen",
];
