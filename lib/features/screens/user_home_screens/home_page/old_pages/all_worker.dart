import 'package:flutter/material.dart';

import '../../../../../widget/costom/costom_orders_card.dart';
import '../../../../../widget/costom/costom_worker1_card.dart';

class AllWorkers extends StatefulWidget {
  const AllWorkers({super.key});

  @override
  State<AllWorkers> createState() => _AllWorkersState();
}

class _AllWorkersState extends State<AllWorkers> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ListView.builder(itemBuilder: (context, snapshot) {
      cardInfo[snapshot];
    });
  }
}

List<Worker1Card> cardInfo = [
  Worker1Card(
      name: "Ahmed",
      numberOfOrders: "10",
      image: "assets/teacher.jpg",
      rank: "5.0",
      icon: Icons.book_rounded),
  Worker1Card(
      name: "Saleh",
      numberOfOrders: "15",
      image: "assets/cleaner.jpg",
      rank: "4.0",
      icon: Icons.cleaning_services)
];
