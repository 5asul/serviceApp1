import 'package:flutter/material.dart';

import '../../../../../controller/componentAPI/valid.dart';

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
        labelText: 'Email Address',
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
    );
  }
}