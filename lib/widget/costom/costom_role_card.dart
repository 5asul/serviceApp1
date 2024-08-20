import 'package:flutter/material.dart';
class CustomRoleCard extends StatelessWidget {
  final String title ;
  final String explain ;
  final String image ;

  final void Function()? ontap ;

  const CustomRoleCard({super.key, this.ontap, required this.title, required this.explain, required this.image, });
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      onHover: (isHovering){

      },
      child: Container(
        height: screenSize.height * 0.20,
        width: screenSize.width* 0.40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: screenSize.width* 0.5,
                  margin: EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Text(title,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(height: 5.0),
                      Text(explain,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,

                      ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: screenSize.width* 0.5,
                    height: screenSize.height* 0.5,
                    child: Image.asset(image,
                    fit:BoxFit.contain),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
