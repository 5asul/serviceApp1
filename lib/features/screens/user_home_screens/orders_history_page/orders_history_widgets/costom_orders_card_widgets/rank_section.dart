import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/theme/app_size.dart';
import '../../../../../../controller/firebase/provider/firebaes_review_provider.dart';
import '../../../../../state_managment/provider/add_order_provider.dart';

class RankSection extends StatelessWidget {
  const RankSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Consumer<FirebaseReviewProvider>(
              builder: (context, provider, child) {
            return Container(
                            child: Column(children: [Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "How Was The Service?",
                                style: TextStyle(
                                  fontSize: AppSize.width(context) * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsTheme().primary.withOpacity(0.8),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: AppSize.width(context) * 0.05),
                                    child: RatingBar.builder(
                                      initialRating: 0,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        provider.ratingValue = rating;
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: AppSize.width(context) * 0.03,
                                ),
                                Text(
                                  '${provider.ratingValue}',
                                  style: TextStyle(
                                      fontSize: AppSize.width(context) * 0.09,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                              ],
                            ),],),
                          );});
  }
}