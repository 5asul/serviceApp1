import 'package:flutter/material.dart';

import '../../../../../config/theme/colors_theme.dart';

class StatusBottun extends StatelessWidget {
  const StatusBottun({
    super.key,
    required this.screenSize,
    required this.selectedStatusButton,
    required this.status,
    required this.isSelected,
  });

  final Size screenSize;
  final void Function() selectedStatusButton;
  final String status;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(
          left: screenSize.width * 0.01,
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: MaterialButton(
            focusColor: (status == 'On Going')
                ? ColorsTheme().primary
                : (status == 'COMPLETED')
                    ? ColorsTheme().secondary
                    : Colors.redAccent,
            minWidth: screenSize.width * 0.3,
            height: screenSize.height * 0.045,
            onPressed: selectedStatusButton,
            color: (isSelected)
                ? (status == 'On Going')
                    ? ColorsTheme().primary
                    : (status == 'COMPLETED')
                        ? ColorsTheme().secondary
                        : Colors.redAccent
                : null,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                  color: (status == 'On Going')
                      ? ColorsTheme().primary
                      : (status == 'COMPLETED')
                          ? ColorsTheme().secondary
                          : Colors.redAccent,
                )),
            child: Text(
              "$status",
              style: TextStyle(
                  fontSize: screenSize.width * 0.030,
                  fontWeight: FontWeight.bold,
                  color: (isSelected)
                      ? ColorsTheme().background
                      : (status == 'On Going')
                          ? ColorsTheme().primary
                          : (status == 'COMPLETED')
                              ? ColorsTheme().secondary
                              : Colors.redAccent),
            ),
          ),
        ),
      ),
    );
  }
}
