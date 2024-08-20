import 'package:flutter/material.dart';

import '../../../../../config/theme/colors_theme.dart';
import '../../../../../widget/costom/costom_worker_card.dart';

class BestWorkersSection extends StatelessWidget {
  const BestWorkersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(left: 14, right: 10, top: 15),
        child: Text(
          "Best Workers ",
          style: TextStyle(
            color: ColorsTheme().primary,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    ),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          WorkerCard(
              name: "Ahmed",
              numberOfOrders: "10",
              image: "assets/teacher.jpg",
              rank: "5.0",
              icon: Icons.book_rounded),
          WorkerCard(
              name: "Saleh",
              numberOfOrders: "10",
              image: "assets/cleaner.jpg",
              rank: "5.0",
              icon: Icons.cleaning_services),
        ],
      ),
    )
      ],
    );
  }
}