import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';
import 'package:project_for_all/features/state_managment/provider/change_notifier_class.dart';
import 'package:provider/provider.dart';

import '../../../../controller/componentAPI/valid.dart';

class PasswordTextFeild extends StatelessWidget {
  const PasswordTextFeild({
    super.key,
    required this.password,
  });

  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    var provider= context.watch<ServiceAppProvider>();
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val) {
        return validInput(val!, 2, 30);
      },
      controller: password,
      keyboardType: TextInputType.visiblePassword,
      onFieldSubmitted: (String value) {
        print(value);
      },
      onChanged: (String value) {
        print(value);
      },
      obscureText: context.watch<ServiceAppProvider>().visible,

      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsTheme().primary)
        ),
        border: OutlineInputBorder(),
        labelText: 'Password',
        floatingLabelStyle: TextStyle(color: ColorsTheme().primary),
        //labelStyle: TextStyle(color: ColorsTheme().primary),

        prefixIcon: Icon(
          Icons.password
        ),
        suffixIcon: (provider.visible==true)?IconButton(onPressed: (){

          provider.updateValue(false);

        },icon: Icon(Icons.visibility_off),)
            :IconButton(onPressed: (){

          provider.updateValue(true);

        },icon: Icon(Icons.visibility),),
      ),
    );
  }
}