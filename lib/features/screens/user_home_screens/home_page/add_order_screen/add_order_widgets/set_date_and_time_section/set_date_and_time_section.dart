import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../../config/theme/colors_theme.dart';
import '../../../../../../state_managment/provider/add_order_provider.dart';
import '../day_date_widget.dart';
import 'time_bottons.dart';

class SetDateAndTimeSection extends StatefulWidget {
  const SetDateAndTimeSection({super.key});

  @override
  State<SetDateAndTimeSection> createState() => _SetDateAndTimeSectionState();
}

class _SetDateAndTimeSectionState extends State<SetDateAndTimeSection> {
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

  String year = DateFormat('y').format(DateTime.now()).toString();
  String day = DateFormat('EEEE').format(DateTime.now()).toString();
  String month = DateFormat('MMMM').format(DateTime.now()).toString();
  late String daynum;
  int dayNumber = DateTime.now().day;
  DateTime now = DateTime.now();
  String dateTime = DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
    final watchProvider = context.watch<AddOrderProvider>();
    final readProvider = context.read<AddOrderProvider>();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: AppSize.width(context) * 0.06,
            bottom: AppSize.height(context) * 0.005,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Text(
                "Set date & time",
                style: TextStyle(
                  fontSize: AppSize.width(context) * 0.03,
                  fontWeight: FontWeight.bold,
                  color: ColorsTheme().primary.withOpacity(0.8),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: AppSize.width(context) * 0.05,
              right: AppSize.width(context) * 0.05),
          child: Container(
            width: AppSize.width(context) * 0.9,
            height: AppSize.height(context) * 0.19,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color:
                        ColorsTheme().primary.withOpacity(0.3), // Shadow color
                    spreadRadius: 0, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: Offset(0, 5), // Offset in the x and y direction
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: ColorsTheme().primary)),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          month,
                          style: TextStyle(
                            fontSize: AppSize.width(context) * 0.045,
                            fontWeight: FontWeight.bold,
                            color: ColorsTheme().primary,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          year,
                          style: TextStyle(
                            fontSize: AppSize.width(context) * 0.045,
                            fontWeight: FontWeight.bold,
                            color: ColorsTheme().primary,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: AppSize.height(context) * 0.02,
                ),
                Row(
                  children: [
                    DayDateWidget(
                      dayNumber: dayNumber,
                      dayName: 'Sat',
                      isSelected: watchProvider.selectedDateAndDay ==
                          "(Saturday)/date:${dayNumber}",
                      onTap: () {
                        context.read<AddOrderProvider>().selectedDateAndDay =
                            '(Saturday)/date:${dayNumber}';
                      },
                    ),
                    DayDateWidget(
                      dayNumber: dayNumber + 1,
                      dayName: 'Sun',
                      isSelected: watchProvider.selectedDateAndDay ==
                          "(Sunday)/date:${dayNumber + 1}",
                      onTap: () {
                        context.read<AddOrderProvider>().selectedDateAndDay =
                            '(Sunday)/date:${dayNumber + 1}';
                      },
                    ),
                    DayDateWidget(
                      dayNumber: dayNumber + 2,
                      dayName: 'Mon',
                      isSelected: watchProvider.selectedDateAndDay ==
                          "(Monday)/date:${dayNumber + 2}",
                      onTap: () {
                        context.read<AddOrderProvider>().selectedDateAndDay =
                            '(Monday)/date:${dayNumber + 2}';
                      },
                    ),
                    DayDateWidget(
                      dayNumber: dayNumber + 3,
                      dayName: 'Tus',
                      isSelected: watchProvider.selectedDateAndDay ==
                          "(Tuesday)/date:${dayNumber + 3}",
                      onTap: () {
                        context.read<AddOrderProvider>().selectedDateAndDay =
                            '(Tuesday)/date:${dayNumber + 3}';
                      },
                    ),
                    DayDateWidget(
                      dayNumber: dayNumber + 4,
                      dayName: 'Wed',
                      isSelected: watchProvider.selectedDateAndDay ==
                          "(Wednesday)/date:${dayNumber + 4}",
                      onTap: () {
                        context.read<AddOrderProvider>().selectedDateAndDay =
                            '(Wednesday)/date:${dayNumber + 4}';
                      },
                    ),
                    DayDateWidget(
                      dayNumber: dayNumber + 5,
                      dayName: 'Thu',
                      isSelected: watchProvider.selectedDateAndDay ==
                          "(Thursday)/date:${dayNumber + 5}",
                      onTap: () {
                        context.read<AddOrderProvider>().selectedDateAndDay =
                            '(Thursday)/date:${dayNumber + 5}';
                      },
                    ),
                    DayDateWidget(
                      dayNumber: dayNumber + 6,
                      dayName: 'Fri',
                      isSelected: watchProvider.selectedDateAndDay ==
                          "(Friday)/date:${dayNumber + 6}",
                      onTap: () {
                        context.read<AddOrderProvider>().selectedDateAndDay =
                            '(Friday)/date:${dayNumber + 6}';
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: AppSize.height(context) * 0.02,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: AppSize.width(context) * 0.055,
              right: AppSize.width(context) * 0.055),
          child: Container(
            width: AppSize.width(context) * 0.9,
            height: AppSize.height(context) * 0.08,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: ColorsTheme().primary)),
            child: Row(
              children: [
                TimeBottons(
                  timeName: 'Morning',
                  screenWidth: AppSize.width(context),
                  isSelected: watchProvider.selectedTime == 'Morning',
                  onTap: () {
                    context.read<AddOrderProvider>().selectedTime = 'Morning';
                  },
                ),
                TimeBottons(
                  timeName: 'Afternoon',
                  screenWidth: AppSize.width(context),
                  isSelected: watchProvider.selectedTime == 'Afternoon',
                  onTap: () {
                    context.read<AddOrderProvider>().selectedTime = 'Afternoon';
                  },
                ),
                TimeBottons(
                  timeName: 'Evening',
                  screenWidth: AppSize.width(context),
                  isSelected: watchProvider.selectedTime == 'Evening',
                  onTap: () {
                    context.read<AddOrderProvider>().selectedTime = 'Evening';
                  },
                ),
                TimeBottons(
                  timeName: 'Night',
                  screenWidth: AppSize.width(context),
                  isSelected: watchProvider.selectedTime == 'Night',
                  onTap: () {
                    context.read<AddOrderProvider>().selectedTime = 'Night';
                  },
                ),
                TimeBottons(
                  timeName: 'Late Night',
                  screenWidth: AppSize.width(context),
                  isSelected: watchProvider.selectedTime == 'Late Night',
                  onTap: () {
                    context.read<AddOrderProvider>().selectedTime =
                        'Late Night';
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
