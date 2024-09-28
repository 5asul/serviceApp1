import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';

import '../../config/theme/colors_theme.dart';

class LocationCard extends StatefulWidget {
  final String name;
  final IconData icon;
  final void Function()? ontap;
  const LocationCard({
    super.key,
    required this.name,
    required this.icon,
    this.ontap,
  });

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isHovered = false;
    return InkWell(
        onTap: () {
          setState(() {
            widget.ontap;
          });
        },
        onHover: (hovering) {
          isHovered = hovering;
        },
        child: Container(
            width: screenSize.width * 0.5,
            height: screenSize.height * 0.18,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppSize.width(context) * 0.032),
            ),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          ColorsTheme().dark,
                          ColorsTheme().dark.withOpacity(0.5),
                        ]),
                    borderRadius:
                        BorderRadius.circular(AppSize.width(context) * 0.032),
                  ),
                  child: Stack(children: [
                    Positioned(
                        top: 95,
                        left: 15,
                        child: Text(
                          widget.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white),
                        )),
                    Positioned(
                        top: 10,
                        left: 90,
                        child: Container(
                            width: screenSize.width * 0.15,
                            height: screenSize.height * 0.08,
                            child: Icon(
                              widget.icon,
                              color: ColorsTheme().primary,
                            ))),
                  ]),
                ))));
  }
}
