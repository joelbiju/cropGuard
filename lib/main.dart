// ignore_for_file: prefer_const_constructors

import 'package:crop_guard/pages/disease_page.dart';
import 'package:crop_guard/pages/result_page.dart';
import 'package:crop_guard/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      );
  }

}