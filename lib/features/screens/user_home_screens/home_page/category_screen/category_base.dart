import 'package:flutter/material.dart';

import 'package:project_for_all/features/screens/user_home_screens/home_page/category_screen/category_pages/all_worker.dart';
import 'package:project_for_all/features/screens/user_home_screens/home_page/category_screen/category_pages/cleaning_workers.dart';
import 'package:project_for_all/features/screens/user_home_screens/home_page/category_screen/category_pages/teaching_workers.dart';

import '../../../../../config/theme/app_size.dart';
import '../../../../../config/theme/colors_theme.dart';

class CategoriesContainerPage extends StatefulWidget {
  const CategoriesContainerPage({super.key});

  @override
  State<CategoriesContainerPage> createState() =>
      _CategoriesContainerPageState();
}

class _CategoriesContainerPageState extends State<CategoriesContainerPage> {
  int i = 0;
  List<Widget> nav = [AllWorkers(), CleaningWorkers(), TeachingWorkers()];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context)
                .pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorsTheme().primary,
          ),
        ),
        title: Text(
          "Categories",
          style: TextStyle(color: ColorsTheme().primary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppSize.height(context) * 0.05,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        i = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: i == index
                                  ? ColorsTheme().primary
                                  : ColorsTheme().primary.withOpacity(0.3))),
                      child: Text(
                        "${WorkerCategory[index]}",
                        style: TextStyle(color: i == index ? ColorsTheme().primary : ColorsTheme().primary),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: AppSize.height(context) * 0.05,
            ),
            nav.elementAt(i)
          ],
        ),
      ),
    );
  }
}

List<String> WorkerCategory = [
  "All Workers",
  "Cleaning Workers",
  "Teaching Workers"
];
