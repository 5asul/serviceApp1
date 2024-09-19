import 'package:flutter/material.dart';

class AddReviewBottun extends StatelessWidget {
  const AddReviewBottun({
    super.key,
    required this.screenSize, 
    required this.addReviewBottomSheet,
  });

  final Size screenSize;
  final Future<void> Function() addReviewBottomSheet;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: screenSize.width * 0.01,
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: MaterialButton(
          minWidth: screenSize.width * 0.3,
          height: screenSize.height * 0.045,
          onPressed: addReviewBottomSheet,
          color: Colors.amber,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Text(
            "Add Review",
            style: TextStyle(
              fontSize: screenSize.width * 0.035,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
