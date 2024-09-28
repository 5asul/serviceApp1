import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/theme/colors_theme.dart';
import '../../../../../state_managment/provider/add_order_provider.dart';

class CustomAddOrderCard extends StatelessWidget {
  final String title;

  const CustomAddOrderCard({
    super.key,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onHover: (isHovering) {},
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Card(
          elevation: 5.0,
          child: Container(
            height: screenSize.height * 0.17,
            width: screenSize.width * 0.95,
            decoration: BoxDecoration(
              color: ColorsTheme().background,
              border: Border.all(color: ColorsTheme().primary),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: screenSize.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            title,
                            maxLines: 2,
                            style: TextStyle(
                              color: ColorsTheme().primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * 0.1,
                        ),
                        InkWell(
                            onTap: () {
                              context
                                  .read<AddOrderProvider>()
                                  .selectedCategoryCardName = '';
                              context
                                  .read<AddOrderProvider>()
                                  .selectedDateAndDay = '';
                              context
                                  .read<AddOrderProvider>()
                                  .workDescriptionController
                                  .text = '';
                              context.read<AddOrderProvider>().selectedTime =
                                  '';
                              Navigator.of(context).pushNamed('add order1');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: AppSize.height(context) * 0.004),
                              width: AppSize.width(context) * 0.2,
                              height: AppSize.height(context) * 0.04,
                              decoration: BoxDecoration(
                                  color: ColorsTheme().primary,
                                  borderRadius: BorderRadius.circular(
                                      AppSize.width(context) * 0.03)),
                              child: Text(
                                'Orders',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: AppSize.width(context) * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsTheme().background,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                      width: AppSize.width(context) * 0.45,
                      child: Image.asset('assets/images/All_home_servicse.png'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
