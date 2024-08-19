  import 'package:flutter/material.dart';

import '../../../../../config/theme/colors_theme.dart';

AppBar SignUpAppBar() {
    return AppBar(
          leading: Container(
            width: 1,
          ),
          backgroundColor: ColorsTheme.primary,
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 55.0),
              child: Text(
                "SignUp",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.white),
              ),
            ),
          ),
          shadowColor: Colors.black,
          elevation: 10.0);
  }