import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';


import '../../../../../controller/componentAPI/valid.dart';


class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key, required this.phone,
    
  });

  final TextEditingController phone;
  

  @override
  Widget build(BuildContext context) {


    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val) {
        return validInput(val!, 2, 30);
      },
      controller:phone ,
      keyboardType: TextInputType.phone,
      onFieldSubmitted: (String value) {
        print(value);
      },
      onChanged: (String value) {
        print(value);
      },
      decoration: InputDecoration(

        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsTheme().primary)
        ),
        labelText: 'Phone number',
        floatingLabelStyle: TextStyle(color: ColorsTheme().primary),
        prefixIcon: Icon(Icons.phone),
        border: OutlineInputBorder(),
      ),
    );
  }
}