import 'package:flutter/material.dart';
import 'package:project_for_all/containers/home_container_page.dart';

import '../widget/costum/costom_worker_profile_card.dart';

class WorkerProfileScreen extends StatefulWidget {
  const WorkerProfileScreen({super.key});

  @override
  State<WorkerProfileScreen> createState() => _WorkerProfileScreenState();
}

class _WorkerProfileScreenState extends State<WorkerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: screenSize.height * 0.07, // Set the height of the FAB
        width: screenSize.width * 0.5,
        margin: EdgeInsets.only(bottom: 15.0), // Set the width of the FAB
        child: FloatingActionButton(
          splashColor: primary,
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).pushNamed('add order1');
          }, // Define the onPressed event
          child: Text(
            "Make Order",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: primary,
            ),
          ), // Add an icon
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('categoryContainer', (route) => false);
          },
          icon: Icon(Icons.arrow_back),
          color: primary,
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: screenSize.width * 1.0,
            height: screenSize.height * 1.0,
            decoration: BoxDecoration(color: Colors.grey.shade300),
          ),
          Container(
            color: Colors.grey.shade300,
            child: WorkerProfileCard(
                name: "Ahmed",
                numberOfOrders: "10",
                image: "assets/teacher.jpg",
                rank: "5.0",
                icon: Icons.book_rounded),
          ),
        ],
      ),
    );
  }
}
