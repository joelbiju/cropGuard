// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_element, avoid_print, unused_field, prefer_final_fields, unused_local_variable, unnecessary_null_comparison

import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:crop_guard/util/button_main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _imageFile;

  String _modelPath = 'assets/paddy_model_tflite.tflite';
  late Interpreter _interpreter;
  
  
  Future<void> loadModel() async {
  try {
    if (_imageFile == null) {
      print('No image selected.');
      return;
    }
    _interpreter = await Interpreter.fromAsset(_modelPath);
    print(_imageFile!.path);
    print(_modelPath);
    print('Model loaded successfully');

    // Call _processImage after interpreter is initialized
    await _processImage(_imageFile!);

  } on Exception {
    print('Failed to load the model.');
  }
}

@override
  void initState() {
    super.initState();
    loadModel();
  }


  Future<void> _pickImage(ImageSource source) async {
  final pickedFile = await ImagePicker().pickImage(source: source);
  if (pickedFile != null) {
    setState(() {
      _imageFile = File(pickedFile.path); 
    });
    // Call the _processImage function to resize here
    setState(() {
      _imageFile = File(pickedFile.path); 
      //_processImage(_imageFile!);
      });
  }
}



Future<Uint8List> _imageToByteArray(img.Image image) async {
  // Convert image to PNG format
  List<int> pngBytes = img.encodePng(image);
  // Convert PNG bytes to Uint8List
  Uint8List byteData = Uint8List.fromList(pngBytes);
  return byteData;
}


Future<void> _processImage(File imageFile) async {
    try {
      img.Image? image = img.decodeImage(await imageFile.readAsBytes());

      if (image != null) {
        img.Image resizedImage = img.copyResize(image, width: 224, height: 224);


        
        // Convert resizedImage back to File
        List<int> resizedBytes = img.encodePng(resizedImage);
        File resizedFile = File('${imageFile.path}_resized.png');
        await resizedFile.writeAsBytes(resizedBytes);

        setState(() {
          _imageFile = resizedFile;
        });

        // Convert resizedImage to Uint8List
        Uint8List imageBytes = await _imageToByteArray(resizedImage);
        print(imageBytes.length);
        print(imageBytes);

        //.......ee block atinu vendi koduthatha
        //convert imageBytes to list<double>
        List<double> imageABCD = imageBytes.map((byte) => byte.toDouble()).toList();
        //.......

        // Normalize image bytes
        List<double> normalizedBytes = imageBytes.map((byte) => byte / 255.0).toList();

        print('Image processed successfully.');
        print(normalizedBytes.length);
        print(normalizedBytes);

        Float32List float32List = Float32List.fromList(normalizedBytes);
        print(float32List.length);

        

        // Run inference with the normalized image data
        await _runInference(imageABCD); //actually ivide NormalizedBytes arnu but njn imageABCD ittatha
      
      } else {
        print('Failed to process the image.');
      }
    } catch (e) {
      print('Error processing image: $e');
    }
}

Future<void> _runInference(List<double> normalizedBytes) async {
  try {
    if (_interpreter == null) {
      _interpreter = await Interpreter.fromAsset(_modelPath);
      print('MODEL loaded successfully');
    }

    print('Running inference...');//

    // Assuming inputShape is defined elsewhere
    var inputShape = [1, 224, 224, 3];

    // Resize input tensor
    _interpreter.resizeInputTensor(0, inputShape);

    // Allocate tensors
    _interpreter.allocateTensors();

    print('Input tensor shape: ${_interpreter.getInputTensor(0).shape}');//
    // Assuming normalizedBytes is a flattened list of normalized pixel values
    Float32List inputBuffer = Float32List(224 * 224 * 3);
    for (var i = 0; i < normalizedBytes.length; i++) {
      inputBuffer[i] = normalizedBytes[i];
    }
    print('Input buffer length: ${inputBuffer.length}');//
    print('Input buffer: $inputBuffer');//

    // Perform the inference
    final outputBuffer = Float32List(4); 
    _interpreter.run(inputBuffer.buffer.asUint8List(), outputBuffer.buffer.asUint8List());
    print('Output buffer length: ${outputBuffer.length}');//
    print('Output buffer: $outputBuffer');//

    // Process output data as needed
    // Find the maximum confidence and its index
    double maxConfidence = double.negativeInfinity;
    int index = -1;
    for (int i = 0; i < outputBuffer.length; i++) {
      if (outputBuffer[i] > maxConfidence) {
        maxConfidence = outputBuffer[i];
        index = i;
      }
    }
    print('Index value: $index');
    print('Maximum confidence: $maxConfidence');

  } catch (e) {
    print('Error during inference: $e');
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
                        Actbutton(btntext: 'Check Disease', onpressed: (){ 
                          loadModel(); 
                        }),
                        
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
