// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_element, avoid_print

import 'dart:io';

import 'package:crop_guard/util/button_main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _retryImage() {
    setState(() {
      _imageFile = null;
    });
  }

  void _processImage() {
    if (_imageFile != null) {
      // Call your model with the image path here
      String imagePath = _imageFile!.path;
      // Now you can pass imagePath to your model for processing
      // For example:
      // myModel.processImage(imagePath);
    } else {
      print("No image selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Capture Image', 
          style: TextStyle(
            color: Colors.grey, 
            fontWeight: FontWeight.w500,
            fontSize: 18),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Actbutton(
                btntext: 'Take Picture', 
                onpressed: () => _pickImage(ImageSource.camera)),
              
              SizedBox(height: 20),
              Actbutton(
                btntext: 'Upload Image', 
                onpressed: () => _pickImage(ImageSource.gallery)),
              
              SizedBox(height: 20),
              if (_imageFile != null)
                Column(
                  children: [
                    Image.file(_imageFile!),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Actbutton(btntext: 'Check Disease', onpressed: (){}),
                        
                      ],
                    ),
                  ],
                ),
              SizedBox(height: 20),
              if (_imageFile == null) Text('No image selected.'),
            ],
          ),
        ),
      ),
    );
  }
}
