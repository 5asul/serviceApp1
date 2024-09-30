import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:popover/popover.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';
import 'package:project_for_all/controller/firebase/provider/api_user_provider.dart';
import 'package:provider/provider.dart';

AppBar BaseHomePageAppBar(
  BuildContext context,
) {
  bool majorSwitchval = false;
  final provider = Provider.of<ApiUserProvider>(context, listen: false);
  return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: ColorsTheme().primary, // Color for the top side
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppSize.width(context) * 0.08),
            bottomRight: Radius.circular(AppSize.width(context) * 0.08),
          ),
        ),
      ),
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(AppSize.height(context) * 0.13),
          child: Container(
              height: AppSize.height(context) * 0.13,
              decoration: BoxDecoration(
                color: ColorsTheme().primary,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppSize.width(context) * 0.08),
                    bottomRight:
                        Radius.circular(AppSize.width(context) * 0.08)),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: AppSize.width(context) * 0.03,
                    vertical: AppSize.height(context) * 0.02),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: ColorsTheme().dark),
                    prefixIcon: Icon(
                      Icons.search,
                      color: ColorsTheme().background,
                    ),
                    suffixIcon: Icon(
                      Icons.filter_list,
                      color: ColorsTheme().background,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppSize.width(context) * 0.02),
                      borderSide: BorderSide(
                        color: ColorsTheme().background,
                        width: AppSize.width(context) * 0.005,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppSize.width(context) * 0.02),
                      borderSide: BorderSide(
                          color: ColorsTheme().background,
                          width: AppSize.width(context) * 0.02),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: ColorsTheme().background,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ))),
      leading: Builder(builder: (context) {
        return IconButton(
            icon: Icon(
              Icons.menu,
              color: ColorsTheme().background,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            });
      }),
      centerTitle: true,
      title: Container(
          width: AppSize.width(context) * 0.4,
          height: AppSize.height(context) * 0.2,
          child: Image.asset("assets/images/logo.png")),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: ColorsTheme().background,
          ),
          onPressed: () async {
            showPopover(
              contentDyOffset: AppSize.height(context) * -0.85,
              arrowDxOffset: AppSize.width(context) * 0.44,
              context: context,
              bodyBuilder: (context) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: AppSize.height(context) * 0.1,
                      child: ListTile(
                        title: Text(
                          "messages...",
                          style: TextStyle(
                              fontSize: AppSize.width(context) * 0.06),
                        ),
                        leading: Icon(Icons.timer_outlined),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.width(context) * 0.05,
                          vertical: AppSize.height(context) * 0.02),
                      child: Divider(),
                    ),
                  ],
                );
              },
              onPop: () => print('Popover was popped!'),
              direction: PopoverDirection.top,
              width: AppSize.width(context) * 0.7,
              height: 300,
              arrowHeight: AppSize.height(context) * 0.02,
              arrowWidth: 30,
            );
          },
        )
      ]);
}
