import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/theme/app_size.dart';
import '../../../../../../controller/firebase/provider/firebase_user_provider.dart';
import '../../../../../../widget/costom/costom_worker1_card.dart';
import '../../../../../state_managment/provider/add_order_provider.dart';
import 'costom_bottom_sheet_worker_card.dart';

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
        vertical: AppSize.height(context) * 0.02,
      ),
      height: AppSize.height(context) * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsTheme().background,
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

            return BottomSheetWorkerCard(
              id: workers.firebaseUid ?? 'Unknown',
              name: workers.username ?? 'Unknown',
              serviceName: workers.serviceName ?? 'Unknown',
              image: workers.profilePic ?? 'Unknown',
              rank: "5.0",
              location: workers.location ?? 'Unknown',
            );
          },
        );
      }),
    );
  }
}
