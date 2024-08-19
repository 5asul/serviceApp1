import 'package:flutter/material.dart';

class CustomSignUpTextFeild extends StatelessWidget {
  final AutovalidateMode autovalidateMode;
  final bool obSecure;
  final Icon? suffixIcon;
  final Icon? icon;
  final String? label;
  final String? Function(String?) valid;
  final TextEditingController myController;

  const CustomSignUpTextFeild(
      {super.key,
      required this.valid,
      required this.myController,
      this.label,
      this.icon,
      this.suffixIcon,
      required this.obSecure,
      required this.autovalidateMode});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        autovalidateMode: autovalidateMode,
        validator: valid,
        controller: myController,
        keyboardType: TextInputType.name,
        obscureText: obSecure,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
