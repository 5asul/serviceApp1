import 'package:flutter/material.dart';

import '../../../../../../../config/theme/colors_theme.dart';
import '../../../../../../../models/worker_work_image.dart';

class PhotosAndVideosSection extends StatelessWidget {
  const PhotosAndVideosSection({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.02,
      vertical: screenSize.height*0.02),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Photos & Videos',
              style: TextStyle(
                fontSize: screenSize.width * 0.06,
                fontWeight: FontWeight.bold,
                color: ColorsTheme().primary,
              ),
            ),
          ),
          Container(
            width: screenSize.width*0.8,
            height: screenSize.height*0.3,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10.0, // Space between columns
                mainAxisSpacing: 10.0, // Space between rows
              ),
              itemCount: WorkerLists.imagesPaths.length,
              itemBuilder: (context, index) {
                return Image.asset("${WorkerLists.imagesPaths[index]}");
              },
            )
          )
        ],
      ),
    );
  }
}