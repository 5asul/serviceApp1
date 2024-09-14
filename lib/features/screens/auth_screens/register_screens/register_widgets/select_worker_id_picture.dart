import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectWorkerIdPicture extends StatefulWidget {
  const SelectWorkerIdPicture(
      {super.key, required this.workerIdPictureController, });

  final TextEditingController workerIdPictureController;

  @override
  State<SelectWorkerIdPicture> createState() => _SelectWorkerIdPictureState();
}

class _SelectWorkerIdPictureState extends State<SelectWorkerIdPicture> {
  File? image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        widget.workerIdPictureController.text = pickedFile.path;
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
            ? Icon(Icons.person_add, size: 50)
            : Image.file(image!, fit: BoxFit.cover),
      ),
    );
  }
}
