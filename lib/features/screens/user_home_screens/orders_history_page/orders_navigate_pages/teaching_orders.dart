import 'package:flutter/material.dart';

import '../../../../../widget/costom/costom_worker1_card.dart';

class TeachingOrders extends StatefulWidget {
  const TeachingOrders({super.key});

  @override
  State<TeachingOrders> createState() => _TeachingOrdersState();
}

class _TeachingOrdersState extends State<TeachingOrders> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder
      (
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (BuildContext context, int i) {
        return Worker1Card(name: "Ahmed",
            numberOfOrders: "10",
            image: "assets/teacher.jpg",
            rank: "5.0",
            icon: Icons.book_rounded);
      },
    );
  }
}
