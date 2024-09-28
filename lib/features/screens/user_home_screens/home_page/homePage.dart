import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_user_provider.dart';
import 'package:project_for_all/features/screens/user_home_screens/user_home_screens_widgets/base_home_screens_appBar.dart';
import 'package:provider/provider.dart';
import '../../../../config/theme/colors_theme.dart';
import '../user_home_screens_widgets/custom_drawer.dart';
import '../user_home_screens_widgets/custom_list_tile.dart';
import 'home_page_widgets/top_rated_section.dart';
import 'home_page_widgets/category_section.dart';
import 'home_page_widgets/top_card_section.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      final usersProvider =
          Provider.of<FirebaseUserProvider>(context, listen: false);
      usersProvider.fetchUsers();
    }

    final provider = Provider.of<FirebaseUserProvider>(context, listen: false);
    final user = provider.users[0];
    return Scaffold(
      drawer: DrawerWidget(),
      backgroundColor: ColorsTheme().background,
      appBar: BaseHomePageAppBar(context),
      body: Column(
        children: [
          SizedBox(
            height: AppSize.height(context) * 0.02,
          ),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  child: Column(
                    children: [
                      TopThreeCards(),
                      SizedBox(
                        height: 10.0,
                      ),
                      CategorySection(),
                      SizedBox(
                        height: 10.0,
                      ),
                      BestWorkersSection()
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
