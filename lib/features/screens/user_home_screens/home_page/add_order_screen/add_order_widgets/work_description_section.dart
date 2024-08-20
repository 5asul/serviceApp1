import 'package:flutter/material.dart';

import '../../../../../../config/theme/app_size.dart';
import '../../../../../../config/theme/colors_theme.dart';

class WorkDescriptionSection extends StatefulWidget {
  const WorkDescriptionSection({super.key});

  @override
  State<WorkDescriptionSection> createState() => _WorkDescriptionSectionState();
}

class _WorkDescriptionSectionState extends State<WorkDescriptionSection> {
  TextEditingController workDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: EdgeInsets.only(
                    left: AppSize.width(context) * 0.055, right: AppSize.width(context) * 0.055),
                child: Container(
                  width: AppSize.width(context) * 1.0,
                  height: AppSize.height(context) * 0.1,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: AppSize.height(context) * 0.005),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'work description',
                            style: TextStyle(
                              fontSize: AppSize.width(context) * 0.03,
                              fontWeight: FontWeight.bold,
                              color: ColorsTheme().primary.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: workDescriptionController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: ColorsTheme().primary)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: ColorsTheme().primary)),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Enter your work description here',
                          labelStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: ColorsTheme().primary,
                          ),
                          fillColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              );
  }
}