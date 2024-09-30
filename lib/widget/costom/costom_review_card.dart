import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:project_for_all/controller/firebase/provider/firebaes_review_provider.dart';
import 'package:project_for_all/models/requests_model.dart';
import 'package:project_for_all/models/reviews_model.dart';
import 'package:project_for_all/models/users_model.dart';
import 'package:provider/provider.dart';

import '../../config/theme/colors_theme.dart';
import '../../controller/firebase/provider/firebase_user_provider.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  void initState() {
    super.initState();

    final userProvider =
        Provider.of<FirebaseUserProvider>(context, listen: false);
    final reviewProvider =
        Provider.of<FirebaseReviewProvider>(context, listen: false);

    reviewProvider.getReviewsStreamById(userProvider.workerId);
    userProvider.fetchReviewUsers();
  }

  @override
  Widget build(BuildContext context) {
    final reviewProvider =
        Provider.of<FirebaseReviewProvider>(context, listen: false);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppSize.width(context) * 0.02,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Reviews',
              style: TextStyle(
                fontSize: AppSize.width(context) * 0.06,
                fontWeight: FontWeight.bold,
                color: ColorsTheme().primary,
              ),
            ),
          ),
        ),
        Consumer2<FirebaseUserProvider, FirebaseReviewProvider>(
            builder: (context, userProvider, reviewProvider, _) {
          return ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: reviewProvider.reviews.length,
            itemBuilder: (context, index) {
              final user = userProvider.reviewUsers
                  .where((user) =>
                      user.firebaseUid ==
                      reviewProvider.reviews[index].clientId)
                  .toList();

              String? timeStamp = reviewProvider.reviews[index].timeStamp;
              DateTime dateTime = DateTime.parse('${timeStamp}');
              String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
              DateTime currentDate = DateTime.now();
              Duration difference = dateTime.difference(currentDate);
              int daysLeft = difference.inDays;
              int hoursLeft = difference.inHours;
              int weeksLeft = 0;
              String date = '';
              if (daysLeft == 0) {
                date = '${hoursLeft} Hours Left';
              } else if (dateTime.day != currentDate.day && daysLeft < 7) {
                date = '${daysLeft} Days left';
              } else if (daysLeft >= 7 && daysLeft < 28) {
                weeksLeft = daysLeft ~/ 7;
                date = '${weeksLeft} Weeks left';
              } else {
                date = '${formattedDate}';
              }
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: widget.screenSize.width * 0.03,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: widget.screenSize.width * 0.02,
                            ),
                            Text(
                              "5.0(${reviewProvider.reviews.length} reviews)",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: widget.screenSize.width * 0.04,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(width: AppSize.width(context) * 0.3),
                        Container(
                          child: Text(
                            'See All',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorsTheme().primary),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: widget.screenSize.height * 0.01,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: widget.screenSize.width * 0.02,
                          right: widget.screenSize.width * 0.02,
                          bottom: widget.screenSize.height * 0.01,
                          top: widget.screenSize.width * 0.015),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            10), // Optional: for rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 0.5, // Spread radius
                            blurRadius: 7, // Blur radius
                            offset: Offset(0, 5), // Shadow position
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: AppSize.width(context) * 1.0,
                            margin: EdgeInsets.symmetric(
                                vertical: widget.screenSize.height * 0.02),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: widget.screenSize.width * 0.06,
                                  backgroundImage: NetworkImage(
                                      user[0].profilePic ?? 'Unknown'),
                                ),
                                SizedBox(
                                  width: widget.screenSize.width * 0.05,
                                ),
                                Text(
                                  user[0].username ?? 'Unknown',
                                  style: TextStyle(
                                      fontSize: widget.screenSize.width * 0.045,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600),
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          widget.screenSize.width * 0.03),
                                  width: AppSize.width(context) * 0.17,
                                  height: widget.screenSize.height * 0.04,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          widget.screenSize.width * 0.06),
                                      border: Border.all(
                                          color: ColorsTheme().primary)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: ColorsTheme().primary,
                                        size: widget.screenSize.width * 0.04,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left:
                                                widget.screenSize.width * 0.01),
                                        child: Text(
                                          '${reviewProvider.reviews[index].rating}',
                                          style: TextStyle(
                                              color: ColorsTheme().primary),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${reviewProvider.reviews[index].comment}',
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_border)),
                              Container(
                                child: Text(
                                  '${reviewProvider.reviews[index].likes}',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: AppSize.width(context) * 0.04),
                                child: Text(
                                  '${date}',
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ],
    );
  }
}
