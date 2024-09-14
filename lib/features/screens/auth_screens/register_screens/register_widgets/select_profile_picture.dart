import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../controller/firebase/provider/firebase_user_provider.dart';

class SelectProfilePicture extends StatefulWidget {
  const SelectProfilePicture(
      {super.key,});

  

  @override
  State<SelectProfilePicture> createState() => _SelectProfilePictureState();
}

class _SelectProfilePictureState extends State<SelectProfilePicture> {
  File? image;

  Future<void> _pickImage() async {
    final userProvider =
          Provider.of<FirebaseUserProvider>(context, listen: false);
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        userProvider.profilePictureController.text = pickedFile.path;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: image == null
            ? Icon(Icons.add_a_photo, size: 50)
            : Image.file(image!, fit: BoxFit.cover),
      ),
    );
  }
}
