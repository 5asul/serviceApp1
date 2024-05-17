import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget {
  final String id ;
  final String srevice_name ;
  final String time ;
  final user_id ;
  final void Function()? ontap ;

  const CustomCard({super.key, required this.time, required this.srevice_name, required this.id, this.user_id, this.ontap, });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
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


                Text("oderer $id",style: TextStyle(
                  fontSize: 30.0
                ) ,
                ),
                Text("$srevice_name"),
                Text('${time}'),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
