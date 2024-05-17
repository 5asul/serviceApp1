import 'package:flutter/material.dart';

import 'continerPage.dart';
import 'main.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Center(
          child: Container(
            child:  Column(
              children: [
                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SearchBar(
                    leading: Icon(Icons.search),
                    hintText: 'Search for services...',
                  ),
                ),
                SizedBox(height: 10.0),
                Container(

                  child: Expanded(
                    child: GridView.count(

                      crossAxisCount: 2,
                      childAspectRatio: 1.5,

                      children: services.map((service) => ServiceItem(service: service)).toList(),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      );

  }
}
