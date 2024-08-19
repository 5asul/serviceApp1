  import 'package:flutter/material.dart';

import '../../../../../config/theme/colors_theme.dart';

AppBar LoginAppBar() {
    return AppBar(
        backgroundColor: ColorsTheme.primary,
    
        title: Center(
            child: Text(
          "Login",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.white),
        )),
        shadowColor: Colors.black,
        elevation: 10.0);
  }