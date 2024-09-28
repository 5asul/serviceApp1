import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:project_for_all/features/screens/user_home_screens/home_page/add_order_screen/add_order_widgets/select_worker_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../home_page_widgets/home_page_sections_widgets/costom_category_card.dart';
import '../../../../../state_managment/provider/add_order_provider.dart';

class AddOrderCategoryCards extends StatelessWidget {
  const AddOrderCategoryCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void showModelBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (context) => SelectWorkerBottomSheet(),
      );
    }

    final watchProvider = context.watch<AddOrderProvider>();
    return Padding(
      padding: EdgeInsets.only(
          left: AppSize.width(context) * 0.055,
          right: AppSize.width(context) * 0.055),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
            height: AppSize.height(context) * 0.25,
            child: Row(
              children: [
                CategoryCard(
                  name: "Cleaning",
                  workerNumber: "+460 workers",
                  image:"assets/images/cleaner.png" ,
                  isSelected:
                      watchProvider.selectedCategoryCardName == "Cleaner",
                  onTap: () async {
                    context.read<AddOrderProvider>().selectedCategoryCardName =
                        'Cleaner';
                    showModelBottomSheet(context);
                  },
                ),
                CategoryCard(
                  name: "Teaching",
                  workerNumber: "+300 workers",
                  image:"assets/images/teacher.png" ,
                  isSelected:
                      watchProvider.selectedCategoryCardName == "Teacher",
                  onTap: () {
                    context.read<AddOrderProvider>().selectedCategoryCardName =
                        'Teacher';
                    showModelBottomSheet(context);
                  },
                ),
                CategoryCard(
                  name: "Electrical",
                  workerNumber: "+460 workers",
                  image:"assets/images/electrical.png" ,
                  isSelected:
                      watchProvider.selectedCategoryCardName == "Electrical",
                  onTap: () {
                    context.read<AddOrderProvider>().selectedCategoryCardName =
                        'Electrical';
                    showModelBottomSheet(context);
                  },
                ),
                CategoryCard(
                  name: "plumber",
                  workerNumber: "+460 workers",
                  image:"assets/images/plumber.png" ,
                  isSelected:
                      watchProvider.selectedCategoryCardName == "plumper",
                  onTap: () {
                    context.read<AddOrderProvider>().selectedCategoryCardName =
                        'plumper';

                    showModelBottomSheet(context);
                  },
                ),
              ],
            )),
      ),
    );
  }
}
