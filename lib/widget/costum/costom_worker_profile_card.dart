import 'package:flutter/material.dart';

import '../../containers/home_container_page.dart';

class WorkerProfileCard extends StatelessWidget {
  final String name;
  final String numberOfOrders;
  final String image;
  final String rank;
  final IconData icon;
  const WorkerProfileCard({super.key, required this.name, required this.numberOfOrders, required this.image, required this.rank, required this.icon});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isHovered = false;
    return Container(
      width: screenSize.width*0.95,
      height: screenSize.height*0.40,
      margin: EdgeInsets.only(left: screenSize.width*0.045,
          right: screenSize.width*0.05,
          top: screenSize.height*0.01),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(

          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0),topRight: Radius.circular(25.0)),
                  image: DecorationImage(image: AssetImage(image),
                    fit: BoxFit.cover,)
              ),
            ),
            Container(
              decoration: BoxDecoration(

                border: Border.all(color: Colors.grey.shade300),
                gradient: LinearGradient(

                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    primary, // End color
                  ],
                ),
              ),
              // Add your child widgets here
            ),
            Positioned(
                top: 15.0,
                left: 15.0,
                child: Container(
                  width: screenSize.width*0.07,
                  height: screenSize.height*0.04,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: primary
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                )
            ),
            Positioned(
              top: 210.0,
              left: 320.0,
              child: Row(
                children: [
                  Text(
                    rank,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: 2.0,),
                  Icon(Icons.star,
                    color: Colors.yellow,)
                ],
              ),
            ),
            Positioned(
                top: 200.0,
                left: 20.0,
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                  ),
                )
            ),
            Positioned(
                top: 235,
                left: 20.0,
                child: Text(
                  "$numberOfOrders Orders ",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15.0
                  ),
                )
            ),


          ],
        ),
      ),
    );
  }
}
