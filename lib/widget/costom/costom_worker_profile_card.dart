import 'package:flutter/material.dart';

import '../../config/theme/colors_theme.dart';
import '../../features/screens/user_home_screens/home_navigation_bar.dart';

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
      width: screenSize.width*1.0,
      height: screenSize.height*0.40,
      // margin: EdgeInsets.only(left: screenSize.width*0.045,
      //     right: screenSize.width*0.05,
      //     top: screenSize.height*0.01),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1.0),
        child: Stack(

          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
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
                    ColorsTheme().primary, // End color
                  ],
                ),
              ),
              // Add your child widgets here
            ),
             Positioned(
                top: screenSize.height*0.04,
                left: screenSize.width*0.05,
                child: Container(
                  width: screenSize.width*0.09,
                  height: screenSize.height*0.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: ColorsTheme().primary
                  ),
                  child: IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                )
            ),
            Positioned(
                top: screenSize.height*0.04,
                left: screenSize.width*0.9,
                child: Container(
                  width: screenSize.width*0.07,
                  height: screenSize.height*0.04,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: ColorsTheme().primary
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                )
            ),

            Positioned(
                top: screenSize.height*0.3,
                left: screenSize.width*0.03,
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
                top: screenSize.height*0.3,
                left: screenSize.width*0.85,
                child: IconButton(
                  onPressed: (){
                    isHovered? isHovered=false : isHovered=true;
                  },
                  icon: (isHovered==false)?Icon(
                      Icons.favorite_border,
                    size: screenSize.width*0.08,
                    color: Colors.white
                  ):Icon(
                      Icons.favorite,
                      size: screenSize.width*0.08,
                      color: Colors.red
                  ),
                )
            ),
            Positioned(
              top: screenSize.height*0.35,
              left: screenSize.width*0.23,
              child: Row(
                children: [
                  Icon(Icons.star,
                    color: Colors.yellow,),
                  SizedBox(width: 2.0,),
                  Text(
                    "${rank} (4,263 reviews)",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: screenSize.width*0.04,
                        fontWeight: FontWeight.bold
                    ),
                  ),


                ],
              ),
            ),
            Positioned(
              top: screenSize.height*0.35,
              left: screenSize.width*0.03,
                child: Text(
                  "$numberOfOrders Orders ",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: screenSize.width*0.04
                  ),
                )
            ),


          ],
        ),
      ),
    );
  }
}
