 import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/colors_theme.dart';
GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
CurvedNavigationBar CostomNavigationBar(int i) {
    return CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: i,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.add, size: 30),
        ],
        color: ColorsTheme().primary,
        buttonBackgroundColor: ColorsTheme().primary,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            i = index;

            print(index);
            print(i);
          });
        },
        letIndexChange: (index) => true,
      );
  }
  
  void setState(Null Function() param0) {
  }