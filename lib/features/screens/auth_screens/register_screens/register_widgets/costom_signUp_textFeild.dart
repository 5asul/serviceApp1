import 'package:flutter/material.dart';
import 'package:project_for_all/features/state_managment/provider/change_notifier_class.dart';
import 'package:provider/provider.dart';

import '../../../../../config/theme/colors_theme.dart';
import '../../../../../controller/componentAPI/valid.dart';

class UsernameTextFeild extends StatelessWidget {
  const UsernameTextFeild({
    super.key, required this.username,
  });

  final TextEditingController username;

  @override
  Widget build(BuildContext context) {
    

    return Container(
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (var val) {
          return validInput(val!, 3, 20);
        },
        controller: username,
        keyboardType: TextInputType.name,
        obscureText: false,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: ColorsTheme().primary),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorsTheme().primary)),
          labelText: "Username",
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
