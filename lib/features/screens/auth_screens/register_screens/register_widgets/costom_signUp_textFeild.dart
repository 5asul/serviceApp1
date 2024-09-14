import 'package:flutter/material.dart';
import 'package:project_for_all/features/state_managment/provider/service_app_provider.dart';
import 'package:provider/provider.dart';


import '../../../../../config/theme/colors_theme.dart';
import '../../../../../controller/componentAPI/valid.dart';
import '../../../../../controller/firebase/provider/firebase_user_provider.dart';

class UsernameTextFeild extends StatelessWidget {
  const UsernameTextFeild({
    super.key,
  });

  
  

  @override
  Widget build(BuildContext context) {
    final userProvider =
          Provider.of<FirebaseUserProvider>(context, listen: false);

    return Container(
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (var val) {
          return validInput(val!, 3, 20);
        },
        controller: userProvider.usernameController,
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
