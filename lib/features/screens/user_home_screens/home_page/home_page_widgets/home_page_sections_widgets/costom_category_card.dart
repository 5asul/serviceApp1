import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';

import '../../../../../../config/theme/colors_theme.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String workerNumber;
  final String image;
  final void Function() onTap;
  final bool isSelected;
  const CategoryCard(
      {super.key,
      required this.name,
      required this.workerNumber,
      required this.onTap,
      required this.isSelected,
      required this.image});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isHovered = false;
    return InkWell(
        onTap: onTap,
        onHover: (hovering) {
          isHovered = hovering;
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: screenSize.width * 0.35,
            height: screenSize.height * 0.18,
            child: Stack(
              children: [
                Center(
                  child: Container(
                      width: screenSize.width * 0.35,
                      height: screenSize.height * 0.16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color:
                              isSelected ? Colors.blue : ColorsTheme().primary,
                        ),
                        color: isSelected
                            ? Colors.blue.withOpacity(0.2)
                            : Colors.white,
                      ),
                      child: Image.asset(image)),
                ),
                Positioned(
                    top: AppSize.height(context) * 0.0015,
                    left: AppSize.width(context) * 0.135,
                    child: Container(
                      width: AppSize.width(context) * 0.225,
                      height: AppSize.height(context) * 0.027,
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.width(context) * 0.015),
                      decoration: BoxDecoration(
                        color: ColorsTheme().background,
                        borderRadius: BorderRadius.circular(
                            AppSize.width(context) * 0.02),
                      ),
                      child: Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.width(context) * 0.042,
                            color: ColorsTheme().primary),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
