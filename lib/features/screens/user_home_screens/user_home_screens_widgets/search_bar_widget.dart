import 'package:flutter/material.dart';

import '../../../../config/theme/app_size.dart';
import '../../../../config/theme/colors_theme.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search...',
        hintStyle: TextStyle(color: ColorsTheme().dark),
        prefixIcon: Icon(
          Icons.search,
          color: ColorsTheme().secondary,
        ),
        suffixIcon: Icon(
          Icons.filter_list,
          color: ColorsTheme().secondary,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(AppSize.width(context) * 0.02),
          borderSide: BorderSide(
            color: ColorsTheme().secondary,
            width: AppSize.width(context) * 0.003,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(AppSize.width(context) * 0.02),
          borderSide: BorderSide(
              color: ColorsTheme().secondary,
              width: AppSize.width(context) * 0.03),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: ColorsTheme().secondary,
            width: AppSize.width(context) * 0.003,
          ),
        ),
      ),
    );
  }
}