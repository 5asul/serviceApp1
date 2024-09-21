import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_user_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../../widget/costom/costom_worker1_card.dart';

class CleaningWorkers extends StatefulWidget {
  const CleaningWorkers({super.key});

  @override
  State<CleaningWorkers> createState() => _CleaningWorkersState();
}

class _CleaningWorkersState extends State<CleaningWorkers> {
   @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    final requestProvider =
        Provider.of<FirebaseUserProvider>(context, listen: false);
    requestProvider.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FirebaseUserProvider>(builder: (context, userProvider, _) {
      final users = userProvider.users.where((user) => user.role == 'worker' && user.serviceName == 'Cleaning').toList();
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: users.length,
        itemBuilder: (BuildContext context, int i) {
          final workers = users[i];
          
          return Worker1Card(
            id: workers.firebaseUid??'Unknown',
              name: workers.username??'Unknown',
              numberOfOrders: "10",
              image: workers.profailePic??'Unknown',
              rank: "5.0",
              icon: Icons.book_rounded);
        },
      );
    });
  }
}
