import 'package:flutter/material.dart';
class AddFields extends StatelessWidget {
  final String $srevice = " blumber";
  final int number = 0;
  final int time = 0;
  const AddFields({super.key, });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(10.0),
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [

                Text("oderer ${number}",style: TextStyle(
                    fontSize: 30.0
                ) ,
                ),
                Text($srevice),
                Text(time.toString()),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
