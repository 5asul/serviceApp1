import 'package:flutter/material.dart';

import '../../features/screens/user_home_screens/home_navigation_bar.dart';

class WorkerCard extends StatelessWidget {
  final String name;
  final String numberOfOrders;
  final String image;
  final String rank;
  final IconData icon;
  const WorkerCard({super.key, required this.name, required this.numberOfOrders, required this.image, required this.rank, required this.icon});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isHovered = false;
    return InkWell(
      onTap: (){
        
      },
      child: Container(
        width: screenSize.width*0.50,
        height: screenSize.height*0.25,
        padding: EdgeInsets.only(left: 10,right: 10,top:10),
        child: Card(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage(image),
              fit: BoxFit.cover)
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
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
                  top: 100.0,
                    left: 20.0,
                    child: Row(
                      children: [
                        Text(
                          rank,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
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
                  top: 125.0,
                    left: 20.0,
                    child: Text(
                  name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                )
                ),
                Positioned(
                  top: 149,
                    left: 20.0,
                    child: Text(
                        "$numberOfOrders Orders ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.0
                      ),
                    )
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
