import 'package:flutter/material.dart';
import 'package:project_for_all/component/crud.dart';
import 'package:project_for_all/constent/linkapi.dart';
import 'package:project_for_all/costum/custom_card.dart';
import 'package:project_for_all/database/sqfLite.dart';
import 'package:project_for_all/main.dart';
import 'continerPage.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with Crud{

  SqlDb sqlDb = SqlDb();
  getService() async {
    await Future.delayed(Duration(seconds: 1));
    print("${sharedPref.getString('id')}");
    try {
      List<Map> response = await sqlDb.readData("SELECT * FROM 'services'WHERE user_id = '${sharedPref.getString('id')}'");
      return response;
    } catch (e) {
      print('Caught a FormatException:$e.message');
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: secondary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView(
            children:[
              FutureBuilder(
                  future: getService(),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      return ListView.builder(

                        itemCount: snap.data.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,i){
                          try {
                            return CustomCard(time: snap.data[i]['time'].toString(), srevice_name: "${snap.data[i]['service_name']}",id: snap.data[i]['id'].toString(),);
                          }catch(e) {
                            print('error :$e');
                          }

                      });
                    }
                    if(snap.connectionState == ConnectionState.waiting){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else if (snap.hasError){
                      return Center(
                        child: Text(
                          'Failed to connect to server'
                        )
                      );
                    }
                    return Center(
                        child: Text(
                          'No Data Found'
                        )
                    );

                  })
            ]
          )
        ),
      ),
    );
  }
}
