import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/models/services_models.dart';

class ServiceItem extends StatefulWidget {
  final ServiceModel service;

  ServiceItem({required this.service});

  @override
  State<ServiceItem> createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => null,
      onHover: (hovering) {
        setState(() {
          isHovering = hovering;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
        //padding: EdgeInsets.only(top : isHovering ? 5 : 3  , bottom: isHovering ? 5 : 3 ),
        child: Card(
          margin: EdgeInsets.all(8.0),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: screenSize.width * 0.20,
                  height: screenSize.height * 0.20,
                  child: Image.asset(
                    widget.service.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.service.name,
                      style: ArabicTextStyle(
                          arabicFont: ArabicFont.arefRuqaa,
                          fontSize: screenSize.width * 0.05),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.0),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      alignment: AlignmentDirectional.centerEnd,
                      width: screenSize.width * 0.20,
                      child: Text(
                        widget.service.description,
                        style: ArabicTextStyle(
                            arabicFont: ArabicFont.amiri,
                            fontSize: screenSize.width * 0.05),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
