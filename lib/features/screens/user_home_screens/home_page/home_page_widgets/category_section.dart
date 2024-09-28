import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../config/theme/app_size.dart';
import '../../../../../config/theme/colors_theme.dart';
import 'home_page_sections_widgets/costom_category_card.dart';
import '../../../../state_managment/provider/add_order_provider.dart';
import '../category_screen/category_base.dart';

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
                  image: "assets/images/cleaner.png",
                  isSelected:
                      addOrederProvider.selectedCategoryCardName == "Cleaner",
                  onTap: () {
                    addOrederProvider.selectedCategoryCardName = 'Cleaner';
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>BaseCategoriesContainerPage()));
                  },
                ),
                CategoryCard(
                  name: "Teaching",
                  workerNumber: "+300 workers",
                  image:"assets/images/teacher.png" ,
                  isSelected:
                      addOrederProvider.selectedCategoryCardName == "Teacher",
                  onTap: () {
                    addOrederProvider.selectedCategoryCardName = 'Teacher';
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>BaseCategoriesContainerPage()));
                  },
                ),
                CategoryCard(
                  name: "Electrical",
                  workerNumber: "+460 workers",
                 image:"assets/images/electrical.png" ,
                  isSelected:
                      addOrederProvider.selectedCategoryCardName == "Electrical",
                  onTap: () {
                    addOrederProvider.selectedCategoryCardName = 'Electrical';
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>BaseCategoriesContainerPage()));
                  },
                ),
                CategoryCard(
                  name: "Plumbing",
                  workerNumber: "+460 workers",
                  image:"assets/images/plumber.png" ,
                  isSelected: addOrederProvider.selectedCategoryCardName == "plumper",
                  onTap: () {
                    addOrederProvider.selectedCategoryCardName = 'plumper';
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=>BaseCategoriesContainerPage()));
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
