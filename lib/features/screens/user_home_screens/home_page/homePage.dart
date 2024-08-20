import 'package:flutter/material.dart';
import 'package:project_for_all/config/theme/app_size.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../../../config/theme/colors_theme.dart';
import 'home_page_widgets/best_workers_section.dart';
import 'home_page_widgets/category_section.dart';
import 'home_page_widgets/top_three_cards.dart';

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
                     TopThreeCards(),
                      SizedBox(
                        height: 10.0,
                      ),
                     CategorySection(),
                      SizedBox(
                        height: 10.0,
                      ),
                      BestWorkersSection()
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
