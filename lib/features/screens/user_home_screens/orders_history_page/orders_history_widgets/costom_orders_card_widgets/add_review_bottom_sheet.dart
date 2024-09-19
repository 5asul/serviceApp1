import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';
import 'package:provider/provider.dart';

import '../../../../../state_managment/provider/add_order_provider.dart';
import 'add_comment_section.dart';
import 'add_photos_section.dart';
import 'rank_section.dart';
import 'submit_review_bottun.dart';

class AddReviewBottomSheet {
  Future<dynamic> showModelBottomSheet(
    BuildContext context,
  ) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppSize.width(context) * 0.07,
                vertical: AppSize.height(context) * 0.02),
            height: AppSize.height(context) * 0.5,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(bottom: AppSize.height(context) * 0.05),
                    child: Text(
                      'Review',
                      style: TextStyle(
                          fontSize: AppSize.width(context) * 0.1,
                          fontWeight: FontWeight.w900,
                          color: ColorsTheme().primary),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        RankSection(),
                        AddPhotosSection(),
                        AddCommentSection(),
                        SubmitReviewBottun(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
