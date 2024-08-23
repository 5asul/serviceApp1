import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';

import '../../../../controller/componentAPI/valid.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.email,
  });

  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val) {
        return validInput(val!, 2, 30);
      },
      controller: email,
      keyboardType: TextInputType.emailAddress,
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
        labelText: 'Email Address',
        floatingLabelStyle: TextStyle(color: ColorsTheme().primary),
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
    );
  }
}