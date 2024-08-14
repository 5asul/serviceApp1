import 'package:flutter/material.dart';

import 'package:project_for_all/nav_pages/all_worker.dart';
import 'package:project_for_all/nav_pages/cleaning_workers.dart';
import 'package:project_for_all/nav_pages/teaching_workers.dart';

import '../containers/home_container_page.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() =>
      _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int i = 0;
  List<Widget> nav = [AllWorkers(), CleaningWorkers(), TeachingWorkers()];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("container", (route) => false);
          },
          child: Icon(
            Icons.arrow_back,
            color: primary,
          ),
        ),
        title: Text(
          "Categories",
          style: TextStyle(color: primary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        i = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: i == index
                                  ? primary
                                  : primary.withOpacity(0.3))),
                      child: Text(
                        "${WorkerCategory[index]}",
                        style: TextStyle(color: i == index ? primary : primary),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            nav.elementAt(i)
          ],
        ),
      ),
    );
  }
}

List<String> WorkerCategory = [
  "All Workers",
  "Cleaning Workers",
  "Teaching Workers"
];