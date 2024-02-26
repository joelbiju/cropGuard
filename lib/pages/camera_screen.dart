// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors

import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _imageFile;
  String ngrokServerUrl1 =
      'https://8da5-103-183-82-194.ngrok-free.app/predict_healthy/'; // Initial value  for healthy or not
  String ngrokServerUrl2 =
      'https://8da5-103-183-82-194.ngrok-free.app/predict_disease/'; // Initial value for disease detection

  Future _pickImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
          source: source, preferredCameraDevice: CameraDevice.rear);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => _imageFile = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> _sendImageToServer(File imageFile) async {
    final url1 = ngrokServerUrl1; // First ngrok server URL for detecting health
    final url2 =
        ngrokServerUrl2; // Second ngrok server URL for detecting disease

    try {
      var formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path,
            filename: imageFile.path.split('/').last),
      });
      final response1 = await Dio(
          BaseOptions(headers: {'Content-Type': 'multipart/form-data'})).post(
        url1,
        data: formData,
      );
      //Send the image to the first ngrok server URL
      // var request1 = http.MultipartRequest('POST', Uri.parse(url1));
      // request1.files
      //     .add(await http.MultipartFile.fromPath('image', imageFile.path));
      // var response1 = await request1.send();

      print(imageFile.uri.toFilePath());
      print(response1.statusCode);
      print(response1.data);
      print(imageFile);

      if (response1.statusCode == 200) {
        // Read the response from the first server

        int result1 = response1.data["prediction"] ?? -1;

        if (result1 == 1) {
          // If the result is 0, send the image to the second ngrok server URL
          final response2 = await Dio(
                  BaseOptions(headers: {'Content-Type': 'multipart/form-data'}))
              .post(
            url1,
            data: formData,
          );

          if (response2.statusCode == 200) {
            // Read the response from the second server
            int result2 = response1.data["prediction"] ??
                -1; // Parse response to integer, default to -1 if parsing fails

            String disease = '';
            if (result2 == 0) {
              //if result2 is 0, then print rice blast
              disease = 'Rice Blast';
            } else if (result2 == 1) {
              //if result2 is 1, then print brown spot
              disease = 'Rice Blight';
            } else if (result2 == 2) {
              //if result2 is 2, then print leaf smut
              disease = 'Brown Spot';
            } else if (result2 == 3) {
              //if result2 is 3, then print healthy
              disease = 'Tungro';
            } else {
              //if result2 is -1, then print disease not detected
              disease = 'Disease not detected';
            }

            // Handle the result from the second server as needed
            print('Disease detected: $disease');
          } else {
            // Handle error from the second server
            print('Failed to detect disease. Error: ${response2.data}');
          }
        } else {
          // Handle when the first server detects the leaf as healthy
          print('Leaf is healthy.');
        }
      } else {
        // Handle error from the first server
        print('FAILED to detect leaf health. Error: ${response1.data}');
      }
    } catch (e) {
      print('Error sending image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Upload Image',
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.camera),
                child: Text('Take Picture'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: Text('Upload Image'),
              ),
              SizedBox(height: 20),
              if (_imageFile != null)
                Column(
                  children: [
                    Image.file(_imageFile!),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _sendImageToServer(
                          _imageFile!), // Use a callback here
                      child: Text('Send Image to Server'),
                    ),
                  ],
                ),
              if (_imageFile == null) Text('No image selected.'),
            ],
          ),
        ),
      ),
    );
  }
}
