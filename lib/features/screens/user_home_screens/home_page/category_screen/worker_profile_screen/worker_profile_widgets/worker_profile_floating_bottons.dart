import 'package:flutter/material.dart';

import '../../../../../../../config/theme/colors_theme.dart';

class WorkerProfileFloatingBottons extends StatelessWidget {
  const WorkerProfileFloatingBottons({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * 0.07, // Set the height of the FAB
      width: screenSize.width * 1.0,
      margin: EdgeInsets.only(bottom: 15.0), // Set the width of the FAB
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenSize.width * 0.3,
            margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.01),
            child: FloatingActionButton(
              heroTag: 'bookNow',
              splashColor: ColorsTheme().primary,
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed('add order1');
              }, // Define the onPressed event
              child: Text(
                "Book Now",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: ColorsTheme().primary,
                ),
              ), // Add an icon
            ),
          ),
          Container(
            width: screenSize.width * 0.3,
            margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.01),
            child: FloatingActionButton(
              heroTag: 'message',
              splashColor: ColorsTheme().primary,
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed('chat with worker screen');
              }, // Define the onPressed event
              child: Text(
                "Message",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: ColorsTheme().primary,
                ),
              ), // Add an icon
            ),
          ),
        ],
      ),
    );
  }
}
