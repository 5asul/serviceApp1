import 'package:flutter/material.dart';

import 'package:project_for_all/config/theme/app_size.dart';
import 'package:project_for_all/widget/costom/costom_category_card.dart';
import 'package:project_for_all/widget/costom/costom_worker_card.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../../../config/theme/colors_theme.dart';
import '../home_navigation_bar.dart';
import '../../../../widget/costom/costom_add_order_card.dart';
import '../../../../widget/costom/costom_location_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  late double latitude;
  late double longitude;
  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    print("tapped");
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    if (permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    }
  }

  _getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String address =
            '${placemark.street}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}';
        print(address);
        return address;
      }
    } catch (e) {
      print('Error getting address: $e');
    }
    return null;
  }

  void getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
              color: ColorsTheme().primary,
            ),
            child: Column(
              children: [
                SearchBar(
                  leading: Icon(Icons.search),
                  hintText: 'Search for services...',
                ),
                SizedBox(
                  height: AppSize.height(context) * 0.03,
                )
              ],
            ),
          ),
          SizedBox(
            height: AppSize.height(context) * 0.02,
          ),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  child: Column(
                    children: [
                      CustomAddOrderCard(
                        title: "Order Your Service ",
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          LocationCard(
                            name: "Your Location",
                            icon: Icons.my_location,
                            ontap: _determinePosition,
                          ),
                          LocationCard(
                              name: "All Orders", icon: Icons.shopping_bag)
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 14, top: 15),
                            child: Text(
                              "Top Categories",
                              style: TextStyle(
                                color: ColorsTheme().primary,
                                fontWeight: FontWeight.bold,
                                fontSize: AppSize.width(context) * 0.065,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(
                            width: AppSize.width(context) * 0.40,
                          ),

                          // IconButton(onPressed: _determinePosition, icon: Icon(Icons.add)),
                          InkWell(
                            onTap: () async {
                              //await _determinePosition;
                              Navigator.of(context).pushNamed(
                                  'categoryContainer',
                                  arguments: (route) => false);
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: ColorsTheme().primary,
                            ),
                          )
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          height: AppSize.height(context) * 0.20,
                          child: Row(
                            children: [
                              CategoryCard(
                                  name: "Cleaning",
                                  workerNumber: "+460 workers",
                                  icon: Icons.cleaning_services),
                              CategoryCard(
                                  name: "Teaching",
                                  workerNumber: "+300 workers",
                                  icon: Icons.book_rounded),
                              CategoryCard(
                                  name: "Cleaning",
                                  workerNumber: "+460 workers",
                                  icon: Icons.dry_cleaning),
                              CategoryCard(
                                  name: "Cleaning",
                                  workerNumber: "+460 workers",
                                  icon: Icons.dry_cleaning),
                              CategoryCard(
                                  name: "Cleaning",
                                  workerNumber: "+460 workers",
                                  icon: Icons.dry_cleaning)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 14, right: 10, top: 15),
                        child: Text(
                          "Best Workers ",
                          style: TextStyle(
                            color: ColorsTheme().primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            WorkerCard(
                                name: "Ahmed",
                                numberOfOrders: "10",
                                image: "assets/teacher.jpg",
                                rank: "5.0",
                                icon: Icons.book_rounded),
                            WorkerCard(
                                name: "Saleh",
                                numberOfOrders: "10",
                                image: "assets/cleaner.jpg",
                                rank: "5.0",
                                icon: Icons.cleaning_services),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<WorkerCard> cardInfo = [
  WorkerCard(
      name: "Ahmed",
      numberOfOrders: "10",
      image: "assets/teacher.jpg",
      rank: "5.0",
      icon: Icons.book_rounded),
  WorkerCard(
      name: "Saleh",
      numberOfOrders: "15",
      image: "assets/cleaner.jpg",
      rank: "4.0",
      icon: Icons.cleaning_services)
];
