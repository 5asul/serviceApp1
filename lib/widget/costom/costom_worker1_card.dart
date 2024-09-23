import 'package:flutter/material.dart';
import 'package:project_for_all/controller/firebase/provider/firebase_request_provider.dart';
import 'package:provider/provider.dart';

import '../../config/theme/colors_theme.dart';

class Worker1Card extends StatelessWidget {
  final String id;
  final String name;
  final String numberOfOrders;
  final String image;
  final String rank;
  final IconData icon;

  const Worker1Card({
    super.key,
    required this.name,
    required this.numberOfOrders,
    required this.image,
    required this.rank,
    required this.icon,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isHovered = false;
    final requestProvider =
        Provider.of<FirebaseRequestProvider>(context, listen: false);
    return InkWell(
      onTap: () {
        requestProvider.workerId = id;
        Navigator.of(context).pushNamed('worker profile');
      },
      child: Container(
        width: screenSize.width * 0.50,
        height: screenSize.height * 0.15,
        padding: EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 0.5, // Spread radius
              blurRadius: 7, // Blur radius
              offset: Offset(0, 5), // Shadow position
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Stack(
            children: [
              Container(
                width: screenSize.width * 0.2,
                height: screenSize.height * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                        alignment: Alignment(1, -0.6))),
              ),
              Positioned(
                  top: 5.0,
                  left: 100.0,
                  child: Container(
                    width: screenSize.width * 0.07,
                    height: screenSize.height * 0.04,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: ColorsTheme().primary),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  )),
              Positioned(
                top: 40.0,
                left: 265.0,
                child: Row(
                  children: [
                    Text(
                      rank,
                      style: TextStyle(
                          color: ColorsTheme().primary,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 2.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 40.0,
                  left: 100.0,
                  child: Text(
                    name,
                    style: TextStyle(
                        color: ColorsTheme().primary,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  )),
              Positioned(
                  top: 70.0,
                  left: 100.0,
                  child: Text(
                    "$numberOfOrders Orders ",
                    style:
                        TextStyle(color: ColorsTheme().primary, fontSize: 11.0),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
