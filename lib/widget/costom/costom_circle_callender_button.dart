import 'package:flutter/material.dart';

import '../../config/theme/colors_theme.dart';

class CircleButton extends StatefulWidget {
  final String dayShort;
  final String day;
  const CircleButton({super.key, required this.day, required this.dayShort, });

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  int getDateNumberFromDayName(String dayName) {
    // Get the current date
    DateTime now = DateTime.now();

    // Find the first day of the current week (Monday)
    DateTime firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));

    // Map day names to their respective weekday numbers
    Map<String, int> dayNameToNumber = {
      'Monday': 1,
      'Tuesday': 2,
      'Wednesday': 3,
      'Thursday': 4,
      'Friday': 5,
      'Saturday': 6,
      'Sunday': 7,
    };

    // Get the weekday number for the provided day name
    int? dayNumber = dayNameToNumber[dayName];

    if (dayNumber == null) {
      throw ArgumentError('Invalid day name: $dayName');
    }

    // Calculate the date for the given day name
    DateTime targetDate = firstDayOfWeek.add(Duration(days: dayNumber - 1));
    daynum = targetDate.day.toString();
    // Return the day of the month
    return targetDate.day;
  }

  late String daynum ;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0,bottom: 5.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Text(
                  widget.dayShort,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: ColorsTheme().primary.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundColor: ColorsTheme().primary,
              child: IconButton(
                icon: Text(
                    daynum
                ),
                onPressed: () {
                  getDateNumberFromDayName(widget.day);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
