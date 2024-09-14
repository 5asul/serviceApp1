import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/theme/app_size.dart';
import '../../../../../config/theme/colors_theme.dart';
import '../../../../../widget/costom/costom_category_card.dart';
import '../../../../state_managment/provider/add_order_provider.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final addOrederProvider =
        Provider.of<AddOrderProvider>(context, listen: false);
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 14, top: 15),
              child: Text(
                "Top Categories",
                style: TextStyle(
                  color: ColorsTheme().primary,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.width(context) * 0.065,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: AppSize.width(context) * 0.40,
            ),

            // IconButton(onPressed: _determinePosition, icon: Icon(Icons.add)),
            InkWell(
              onTap: () async {
                //await _determinePosition;
                Navigator.of(context).pushNamed('categoryContainer');
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: ColorsTheme().primary,
              ),
            )
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            height: AppSize.height(context) * 0.20,
            child: Row(
              children: [
                CategoryCard(
                  name: "Cleaning",
                  workerNumber: "+460 workers",
                  icon: Icons.cleaning_services,
                  isSelected:
                      addOrederProvider.selectedDateAndDay == "Cleaning",
                  onTap: () {
                    addOrederProvider.selectedDateAndDay = 'Cleaning';
                  },
                ),
                CategoryCard(
                  name: "Teaching",
                  workerNumber: "+300 workers",
                  icon: Icons.book_rounded,
                  isSelected:
                      addOrederProvider.selectedDateAndDay == "Teaching",
                  onTap: () {
                    addOrederProvider.selectedDateAndDay = 'Teaching';
                  },
                ),
                CategoryCard(
                  name: "Electrical",
                  workerNumber: "+460 workers",
                  icon: Icons.dry_cleaning,
                  isSelected:
                      addOrederProvider.selectedDateAndDay == "Electrical",
                  onTap: () {
                    addOrederProvider.selectedDateAndDay = 'Electrical';
                  },
                ),
                CategoryCard(
                  name: "plumper",
                  workerNumber: "+460 workers",
                  icon: Icons.dry_cleaning,
                  isSelected: addOrederProvider.selectedDateAndDay == "plumper",
                  onTap: () {
                    addOrederProvider.selectedDateAndDay = 'plumper';
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
