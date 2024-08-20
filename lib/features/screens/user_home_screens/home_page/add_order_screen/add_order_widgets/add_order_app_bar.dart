import 'package:flutter/material.dart';

AppBar AddOrderAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text('Order service'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("login", (route) => false);
            },
          )
        ]);
  }