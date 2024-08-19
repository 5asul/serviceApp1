import 'package:flutter/material.dart';
class OrdersCard extends StatelessWidget {
  final String id ;
  final String service_name ;
  final String time ;
  final user_id ;
  final void Function()? ontap ;

  const OrdersCard({super.key, required this.time, required this.service_name, required this.id, this.user_id, this.ontap, });
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.all(10.0),
        height: screenSize.height * 0.15,
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
                  fontSize: screenSize.width*0.05,
                ) ,
                ),
                Text("$service_name"),
                Text('${time}'),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
