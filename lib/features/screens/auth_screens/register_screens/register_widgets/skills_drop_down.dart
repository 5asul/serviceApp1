import 'package:flutter/material.dart';
import 'package:project_for_all/main.dart';

import '../../../../../config/theme/app_size.dart';
import '../../../../../config/theme/colors_theme.dart';

class SkillsDropDown extends StatelessWidget {
  const SkillsDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? selectedService;
    String? svalue = "-1";
    return Container(
      width: AppSize.width(context) * 1.0,
      child: DropdownButtonFormField(
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppSize.width(context) * 0.04),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsTheme().primary)),
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
              "Select the srevice...",
              style: TextStyle(color: Colors.grey.shade700),
            ),
            value: "-1",
          ),
          DropdownMenuItem(
            child: Text(
              "- Cleaner",
              style: TextStyle(
                color: ColorsTheme().primary,
              ),
            ),
            value: "0",
          ),
          DropdownMenuItem(
            child: Text(
              "- Teacher",
              style: TextStyle(
                color: ColorsTheme().primary,
              ),
            ),
            value: "1",
          ),
          DropdownMenuItem(
            child: Text(
              "- Electrical",
              style: TextStyle(
                color: ColorsTheme().primary,
              ),
            ),
            value: "2",
          ),
          DropdownMenuItem(
            child: Text(
              "- plumper",
              style: TextStyle(
                color: ColorsTheme().primary,
              ),
            ),
            value: "3",
          )
        ],
        onChanged: (value) {
          selectedService = value!;
          (value=='0')?sharedPref.setString('skills', skills[0]):(value=='1')?sharedPref.setString('skills', skills[1])
          :(value=='2')?sharedPref.setString('skills', skills[2]):sharedPref.setString('skills', skills[3]);
        },
      ),
    );
  }
}

List<String> skills = [
  "Cleaner",
  "Teacher",
  "Electrical",
  "Plumber",
];
