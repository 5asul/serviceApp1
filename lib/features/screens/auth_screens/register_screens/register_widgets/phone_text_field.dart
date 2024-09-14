import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';
import 'package:provider/provider.dart';


import '../../../../../controller/componentAPI/valid.dart';
import '../../../../../controller/firebase/provider/firebase_user_provider.dart';


class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key, 
    
  });

  
  

  @override
  Widget build(BuildContext context) {
    final userProvider =
          Provider.of<FirebaseUserProvider>(context, listen: false);
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val) {
        return validInput(val!, 2, 30);
      },
      controller:userProvider.phoneController,
      keyboardType: TextInputType.phone,
      onFieldSubmitted: (String value) {
        print(value);
      },
      onChanged: (String value) {
        
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