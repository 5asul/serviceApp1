import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/theme/app_size.dart';
import '../../../../../../config/theme/colors_theme.dart';
import '../../../../../../controller/firebase/provider/firebaes_review_provider.dart';
import '../../../../../state_managment/provider/add_order_provider.dart';

class AddPhotosSection extends StatelessWidget {
  const AddPhotosSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSize.height(context) * 0.025),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: AppSize.height(context) * 0.02),
              child: Text(
                "Add Photo",
                style: TextStyle(
                  fontSize: AppSize.width(context) * 0.04,
                  fontWeight: FontWeight.bold,
                  color: ColorsTheme().primary.withOpacity(0.8),
                ),
              ),
            ),
          ),
          Consumer<FirebaseReviewProvider>(builder: (context, review, child) {
            return GestureDetector(
              onTap: () async {
                final picker = ImagePicker();
                final pickedFiles = await picker.pickMultiImage();
                review.selectedImages =
                    pickedFiles.map((file) => File(file.path)).toList();
                            },
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: review.selectedImages.isNotEmpty
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                        ),
                        itemCount: review.selectedImages.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Image.file(review.selectedImages[index],
                                  fit: BoxFit.cover),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: GestureDetector(
                                  onTap: () {
                                    review.removeImage(index);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    : Center(child: Text("Tap to add photos")),
              ),
            );
          })
        ],
      ),
    );
  }
}
