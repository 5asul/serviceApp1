import 'package:flutter/material.dart';

import '../../../../../config/theme/app_size.dart';
import '../../../../../config/theme/colors_theme.dart';
import '../../../../../widget/costom/costom_category_card.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                Navigator.of(context).pushNamed(
                    'categoryContainer');
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
                    icon: Icons.cleaning_services),
                CategoryCard(
                    name: "Teaching",
                    workerNumber: "+300 workers",
                    icon: Icons.book_rounded),
                CategoryCard(
                    name: "Cleaning",
                    workerNumber: "+460 workers",
                    icon: Icons.dry_cleaning),
                CategoryCard(
                    name: "Cleaning",
                    workerNumber: "+460 workers",
                    icon: Icons.dry_cleaning),
                CategoryCard(
                    name: "Cleaning",
                    workerNumber: "+460 workers",
                    icon: Icons.dry_cleaning)
              ],
            ),
          ),
        ),
      ],
    );
  }
}