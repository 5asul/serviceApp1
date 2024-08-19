import 'package:flutter/material.dart';

import '../../../../../controller/componentAPI/valid.dart';

class PasswordTextFeild extends StatelessWidget {
  const PasswordTextFeild({
    super.key,
    required this.password,
  });

  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
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
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock),
        suffixIcon: Icon(
          Icons.remove_red_eye,
        ),
      ),
    );
  }
}