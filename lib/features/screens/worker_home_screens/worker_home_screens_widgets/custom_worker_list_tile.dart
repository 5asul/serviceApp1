import 'package:flutter/material.dart';

class CustomWorkerListTile extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  final String title;
  CustomWorkerListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
