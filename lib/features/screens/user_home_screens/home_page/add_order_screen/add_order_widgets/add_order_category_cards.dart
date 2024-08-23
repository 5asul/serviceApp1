import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';

import '../../../../../../widget/costom/costom_category_card.dart';

class AddOrderCategoryCards extends StatelessWidget {
  const AddOrderCategoryCards({
    super.key,
   
  });

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppSize.width(context) * 0.055, right: AppSize.width(context) * 0.055),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          height: AppSize.height(context) * 0.25,
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
    );
  }
}