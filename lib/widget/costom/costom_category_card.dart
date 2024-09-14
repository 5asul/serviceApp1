import 'package:flutter/material.dart';

import '../../config/theme/colors_theme.dart';

class CategoryCard extends StatelessWidget {

  final String name;
  final String workerNumber;
  final IconData icon;
  final void Function() onTap;
  final bool isSelected;
  const CategoryCard({super.key, required this.name, required this.workerNumber, required this.icon, required this.onTap, required this.isSelected});


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isHovered = false;
    return InkWell(
        onTap: onTap,
        onHover: (hovering){
          isHovered = hovering;
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: screenSize.width*0.35,
              height: screenSize.height*0.16,
              decoration:
              BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: isSelected ? Colors.blue : ColorsTheme().primary,
                ),
                color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.white,
              ),
              child: Stack(

                  children: [
                    Positioned(
                        top: 85,
                        left: 20,
                        child: Text(name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.grey.shade700
                          ),)
                    ),
                    Positioned(
                        top: 15,
                        left: 20,
                        child:
                        Icon(icon,
                        size: 30.0,
                        color: ColorsTheme().primary,)

                    ),
                  ]
              )
          ),
        )
    );
  }
}
