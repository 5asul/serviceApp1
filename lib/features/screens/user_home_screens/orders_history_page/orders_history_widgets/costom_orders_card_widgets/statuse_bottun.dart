import 'package:flutter/material.dart';

import '../../../../../../config/theme/colors_theme.dart';

class OrdersStatusBottun extends StatelessWidget {
  const OrdersStatusBottun({
    super.key,
    required this.screenSize,
    required this.selectedStatusButton,
    required this.status,
    required this.isSelected,
    required this.delete,
    required this.update,
  });

  final Size screenSize;
  final void Function() selectedStatusButton;
  final String status;
  final bool isSelected;
  final void Function() delete;
  final void Function() update;

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
          onPressed: selectedStatusButton,
          color: (status == 'PENDING')
              ? ColorsTheme().dark
              : (status == 'On Going')
                  ? ColorsTheme().secondary
                  : (status == 'COMPLETED')
                      ? ColorsTheme().primary
                      : Colors.redAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: (isSelected)
              ? AnimatedOpacity(
                  opacity: isSelected ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 200),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: screenSize.width * 0.07,
                        ),
                        onPressed: delete,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: ColorsTheme().background,
                          size: screenSize.width * 0.07,
                        ),
                        onPressed: update,
                      ),
                    ],
                  ),
                )
              : Text(
                  "$status",
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
