// ignore_for_file: prefer_const_constructors, unused_import

import 'package:crop_guard/firebase_options.dart';
import 'package:crop_guard/pages/camera_screen.dart';
import 'package:crop_guard/pages/disease_page.dart';
import 'package:crop_guard/pages/email_page.dart';
import 'package:crop_guard/pages/home_page.dart';
import 'package:crop_guard/pages/result_page.dart';
import 'package:crop_guard/pages/signin_page.dart';
import 'package:crop_guard/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CameraScreen(),
      //here is SplashScreen
    );
  }
}
