import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/theme/app_size.dart';
import '../../../../../../controller/firebase/provider/firebase_user_provider.dart';
import '../../../../../../widget/costom/costom_worker1_card.dart';
import '../../../../../state_managment/provider/add_order_provider.dart';

class SelectWorkerBottomSheet extends StatefulWidget {
  @override
  _SelectWorkerBottomSheetState createState() =>
      _SelectWorkerBottomSheetState();
}

class _SelectWorkerBottomSheetState extends State<SelectWorkerBottomSheet> {
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
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.width(context) * 0.07,
        vertical: AppSize.height(context) * 0.02,
      ),
      height: AppSize.height(context) * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child:
          Consumer<FirebaseUserProvider>(builder: (context, userProvider, _) {
        final watchProvider = context.watch<AddOrderProvider>();

        final users = userProvider.users
            .where((user) =>
                user.role == 'worker' &&
                user.serviceName == watchProvider.selectedCategoryCardName)
            .toList();
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: users.length,
          itemBuilder: (BuildContext context, int i) {
            final workers = users[i];

            return Worker1Card(
                id: workers.firebaseUid ?? 'Unknown',
                name: workers.username ?? 'Unknown',
                numberOfOrders: "10",
                image: workers.profailePic ?? 'Unknown',
                rank: "5.0",
                icon: Icons.book_rounded);
          },
        );
      }),
    );
  }
}
