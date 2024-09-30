import 'package:flutter/material.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_user_provider.dart';

import 'package:provider/provider.dart';

import '../../../../../config/theme/app_size.dart';
import '../../../../../config/theme/colors_theme.dart';
import '../../../../../widget/costom/costom_worker1_card.dart';
import '../../../../state_managment/provider/add_order_provider.dart';
import '../../user_home_screens_widgets/search_bar_widget.dart';

class AllCategoriesContainerPage extends StatefulWidget {
  const AllCategoriesContainerPage({super.key});

  @override
  State<AllCategoriesContainerPage> createState() =>
      _AllCategoriesContainerPageState();
}

class _AllCategoriesContainerPageState
    extends State<AllCategoriesContainerPage> {
  @override
  void initState() {
    super.initState();
    final usersProvider =
        Provider.of<FirebaseUserProvider>(context, listen: false);
    usersProvider.fetchUsers();
  }

  int i = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorsTheme().primary,
          ),
        ),
        title: Text(
          "Categories",
          style: TextStyle(color: ColorsTheme().primary),
        ),
        centerTitle: true,
      ),
      body: Consumer<FirebaseUserProvider>(builder: (context, userProvider, _) {
        final watchProvider = context.watch<AddOrderProvider>();

        final users =
            userProvider.users.where((user) => user.role == 'worker').toList();
        return Container(
          child: Column(
            children: [
              SizedBox(
                height: AppSize.height(context) * 0.04,
              ),
              Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppSize.width(context) * 0.04),
                  child: SearchBarWidget()),
              SizedBox(
                height: AppSize.height(context) * 0.05,
              ),
              ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: users.length,
                itemBuilder: (BuildContext context, int i) {
                  final workers = users[i];

                  return Worker1Card(
                    id: workers.firebaseUid ?? 'Unknown',
                    name: workers.username ?? 'Unknown',
                    serviceName: workers.serviceName ?? 'Unknown',
                    image: workers.profilePic ?? 'Unknown',
                    rank: "5.0",
                    location: workers.location ?? 'Unknown',
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
