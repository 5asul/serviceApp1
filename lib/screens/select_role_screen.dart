import 'package:flutter/material.dart';
import '../containers/home_container_page.dart';
import '../widget/costum/costume_role_card.dart';

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key});

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondary,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: ListView(
            children: [
              SizedBox(
                height: screenSize.height * 0.2,
              ),
              Text(
                "Select a Role",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: screenSize.height * 0.04,
              ),
              CustomRoleCard(
                title: "Looking for a worker",
                explain: "to place any type of order to find a worker",
                image: "assets/images/customer.png",
                ontap: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('container', (route) => false);
                },
              ),
              SizedBox(
                height: screenSize.height * 0.04,
              ),
              CustomRoleCard(
                title: "Looking for a work",
                explain: "You click here to apply to a work as a worker",
                image: "assets/images/worker.png",
              )
            ],
          ),
        ),
      ),
    );
  }
}
