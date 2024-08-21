import 'package:flutter/material.dart';

import '../../../../../../config/theme/app_size.dart';
import '../../../../../../config/theme/colors_theme.dart';

class AddOrderFloatingBotton extends StatelessWidget {
  const AddOrderFloatingBotton({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.height(context) * 0.07, // Set the height of the FAB
      width: AppSize.width(context) * 0.9,
      margin: EdgeInsets.only(
          bottom: AppSize.height(context) * 0.05), // Set the width of the FAB
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        splashColor: ColorsTheme().primary.withOpacity(0.8),
        backgroundColor: ColorsTheme().primary,
        onPressed: () {
          Navigator.of(context).pushNamed('add order1');
        }, // Define the onPressed event
        child: Text(
          "Make Order",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ), // Add an icon
      ),
    );
  }
}