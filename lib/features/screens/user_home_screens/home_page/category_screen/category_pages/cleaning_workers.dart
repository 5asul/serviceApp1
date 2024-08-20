import 'package:flutter/material.dart';

import '../../../../../../widget/costom/costom_worker1_card.dart';

class CleaningWorkers extends StatefulWidget {
  const CleaningWorkers({super.key});

  @override
  State<CleaningWorkers> createState() => _CleaningWorkersState();
}

class _CleaningWorkersState extends State<CleaningWorkers> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder
      (
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (BuildContext context, int i) {
        return Worker1Card(name: "Saleh",
            numberOfOrders: "15",
            image: "assets/cleaner.jpg",
            rank: "4.0",
            icon: Icons.cleaning_services);
      },
    );
  }
}
