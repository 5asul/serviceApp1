import 'package:flutter/material.dart';

import '../../../../../../config/theme/app_size.dart';
import '../../../../../../config/theme/colors_theme.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({
    super.key,
   
  });

 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppSize.width(context) * 0.055, right: AppSize.width(context) * 0.055),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: AppSize.height(context) * 0.002),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding:
                      EdgeInsets.only(bottom: AppSize.height(context) * 0.005),
                  child: Text(
                    "Payment",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: ColorsTheme().primary.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width(context) * 0.02,
                  vertical: AppSize.height(context) * 0.005),
              width: AppSize.width(context) * 1.0,
              height: AppSize.height(context) * 0.08,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: ColorsTheme().primary)),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Credit Card",
                        style: TextStyle(
                            color: ColorsTheme().primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "**** **** **** 4825",
                        style: TextStyle(
                            color: ColorsTheme()
                                .primary
                                .withOpacity(0.8),
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Image.asset(
                    'assets/images/Mastercard.png',
                    width: AppSize.width(context) * 0.15,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}