import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/theme/colors_theme.dart';
import '../../../../../controller/firebase/provider/firebase_user_provider.dart';
import '../../../../state_managment/provider/add_order_provider.dart';
import 'home_page_sections_widgets/costom_worker_card.dart';

class BestWorkersSection extends StatelessWidget {
  const BestWorkersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FirebaseUserProvider>(builder: (context, userProvider, _) {
      final watchProvider = context.watch<AddOrderProvider>();

      final users =
          userProvider.users.where((user) => user.role == 'worker').toList();
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(left: 14, right: 10, top: 15),
              child: Text(
                "Top Rated ",
                style: TextStyle(
                  color: ColorsTheme().primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (context, index) {
                final workers = users[index];
                return WorkerCard(
                  id: workers.firebaseUid ?? 'Unknown',
                  name: workers.username ?? 'Unknown',
                  serviceName: workers.serviceName ?? 'Unknown',
                  image: workers.profilePic ?? 'Unknown',
                  rank: "5.0",
                  location: workers.location ?? 'Unknown',
                );
              })
        ],
      );
    });
  }
}
