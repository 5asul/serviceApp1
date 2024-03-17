import 'package:flutter/material.dart';
import 'package:arabic_font/arabic_font.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final Color primary = Color.fromRGBO(118, 171, 174,1.0);
final Color secondary = Color.fromRGBO(238, 238, 238,1.0);

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {

          },
        ),
        centerTitle: true,
        title: Text('Services App'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.person),
              iconSize: 30.0,
              onPressed: () {

              },
            ),
          ),
        ],
      ),
      backgroundColor: secondary,
      body: Column(
        children: [
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBar(
              leading: Icon(Icons.search),
              hintText: 'Search for services...',
            ),
          ),
          SizedBox(height: 10.0),
          Container(

            child: Expanded(
              child: GridView.count(

                crossAxisCount: 2,
                childAspectRatio: 1.5,

                children: services.map((service) => ServiceItem(service: service)).toList(),
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(items: [
        Icon(Icons.verified_user,size:30, color:Colors.black ),
        Icon(Icons.add,size:30, color:Colors.black ),
        Icon(Icons.list,size:30, color:Colors.black ),
      ],
        onTap: (index){
        debugPrint('current index is $index');
        },
        backgroundColor: secondary
      ),

    );

  }
}

//كلاس عشان نوصل لليست
class Service {
  final String name;
  final String imagePath;
  final String description;

  Service({required this.name, required this.imagePath, required this.description});
}
// اليست الخاص بالخدمات
List<Service> services = [
  Service(
      name: 'كهرباء',
      imagePath: 'assets/Electrical.jpg',
      description: 'خدمات كهربائية منزلية وتجارية'),
  Service(
      name: 'سباكة',
      imagePath: 'assets/Plumbing.jpeg',
      description: 'خدمات سباكة منزلية وتجارية'),
  // ... المزيد من العناصر
];

// كلاس خاص بانشاء الكاردز
class ServiceItem extends StatefulWidget {

  final Service service;

  ServiceItem({required this.service});

  @override
  State<ServiceItem> createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>null,
      onHover: (hovering){
        setState(() {
          isHovering = hovering;
        });
      },

      child: AnimatedContainer(

        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
        //padding: EdgeInsets.only(top : isHovering ? 5 : 3  , bottom: isHovering ? 5 : 3 ),
        child: Card(
          margin: EdgeInsets.all(8.0),
        
          child: Padding(
        
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  child: Image.asset(widget.service.imagePath,
                  fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8.0),
        
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.service.name,
                      style: ArabicTextStyle(arabicFont: ArabicFont.arefRuqaa,
                      fontSize: 15.0),
        
                      overflow: TextOverflow.ellipsis,
        
                    ),
                    SizedBox(height: 4.0),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      alignment: AlignmentDirectional.centerEnd,
                      width: 70.0,
                      child: Text(
                        widget.service.description,
                        style: ArabicTextStyle(arabicFont: ArabicFont.amiri,
                        fontSize: 12.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
