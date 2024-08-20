import 'package:flutter/material.dart';

import '../../../../../widget/costom/costom_add_order_card.dart';
import '../../../../../widget/costom/costom_location_card.dart';

class TopThreeCards extends StatelessWidget {
  const TopThreeCards({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
                        children: [
                          CustomAddOrderCard(
                            title: "Order Your Service ",
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              LocationCard(
                                name: "Your Location",
                                icon: Icons.my_location,
                                // ontap: _determinePosition,
                              ),
                              LocationCard(
                                  name: "All Orders", icon: Icons.shopping_bag)
                            ],
                          ),
                        ],
                      );
  }
}