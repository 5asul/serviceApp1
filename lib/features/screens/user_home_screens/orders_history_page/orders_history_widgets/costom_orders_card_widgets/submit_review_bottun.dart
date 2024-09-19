import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/colors_theme.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/theme/app_size.dart';
import '../../../../../../controller/firebase/provider/firebaes_review_provider.dart';
import '../../../../../../models/reviews_model.dart';
import '../../../../../state_managment/provider/add_order_provider.dart';

class SubmitReviewBottun extends StatelessWidget {
  const SubmitReviewBottun({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> addRequest() async {
      try {
        final watchOrder =
            Provider.of<AddOrderProvider>(context, listen: false);
        final reviewProvider =
            Provider.of<FirebaseReviewProvider>(context, listen: false);
        final user = FirebaseAuth.instance.currentUser;
        // var random = Random().nextDouble() * 535.59;
        ReviewsModel newRequest = ReviewsModel(
          requestId: '',
          reviewId: '',
          rating: 0,
          comment: '',
          likes: 0,
          timeStamp:
              'date:${watchOrder.selectedDateAndDay} at ${watchOrder.selectedTime}',
        );
        return reviewProvider.addRequest(newRequest);
      } catch (e) {
        print(e);
      }
    }

        final provider = Provider.of<AddOrderProvider>(context, listen: false);

    return Container(
      
      width: AppSize.width(context) * 0.4,
      margin: EdgeInsets.symmetric(
          vertical: AppSize.height(context) * 0.025),
      child: FloatingActionButton(
        onPressed: () {
          // Handle the submit action
          print('Rating: ${provider.ratingValue}');
          print('Comment: ${provider.comment}');
          print(
              'Selected Images: ${provider.selectedImages.length}');
          Navigator.pop(context);
        },
        backgroundColor: ColorsTheme().primary,
        child: Padding(
          padding: EdgeInsets.symmetric(
          horizontal: AppSize.width(context) * 0.07),
          child: Row(
            children: [
              Icon(Icons.send,
              color: ColorsTheme().white,),
              SizedBox(width: 10),
              Text('Submit',
              style: TextStyle(
                color: ColorsTheme().white,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}