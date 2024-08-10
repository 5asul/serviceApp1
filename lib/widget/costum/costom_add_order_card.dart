import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../containers/home_container_page.dart';
class CustomAddOrderCard extends StatelessWidget {
  final String title ;

  const CustomAddOrderCard({super.key,  required this.title,  });
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onHover: (isHovering){

      },
      child: Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: Card(
          elevation: 5.0,
          child: Container(
            height: screenSize.height * 0.10,
            width: screenSize.width* 0.95,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width*0.20,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamedAndRemoveUntil("add order1", (route) => false);
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
