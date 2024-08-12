import 'package:flutter/material.dart';

import '../widget/costum/costom_worker1_card.dart';

class TeachingWorkers extends StatefulWidget {
  const TeachingWorkers({super.key});

  @override
  State<TeachingWorkers> createState() => _TeachingWorkersState();
}

class _TeachingWorkersState extends State<TeachingWorkers> {
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
