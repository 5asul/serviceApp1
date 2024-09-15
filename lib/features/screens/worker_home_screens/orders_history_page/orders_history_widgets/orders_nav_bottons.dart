import 'package:flutter/material.dart';

import '../../../../../config/theme/colors_theme.dart';

class OrdersPageNavBottons extends StatelessWidget {
  const OrdersPageNavBottons({
    super.key,
    required this.i, required this.index,
  });

  final int i;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: i == index
                  ? ColorsTheme().primary
                  : ColorsTheme().primary.withOpacity(0.3))),
      child: Text(
        "${WorkerCategory[index]}",
        style: TextStyle(
            color: i == index ? ColorsTheme().primary : ColorsTheme().primary),
      ),
    );
  }
}

List<String> WorkerCategory = [
  "All Orders",
  "Cleaning Orders",
  "Teaching Orders"
];
