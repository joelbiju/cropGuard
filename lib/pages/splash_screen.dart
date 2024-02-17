// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:crop_guard/pages/signin_page.dart';
import 'package:crop_guard/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> _checkFirstLaunch(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('firstLaunch') ?? true;
    if (isFirstLaunch) {
      // If it's the first launch, navigate to the sign-in page
      prefs.setBool('firstLaunch', false);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Signin()),
      );
    } else {
      // If it's not the first launch, navigate to the home page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => MyHome()),
      );
    }
  }

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //delay of 3 seconds
    Future.delayed(Duration(seconds: 5), () {
      _checkFirstLaunch(context);
    });

    return Scaffold(
      backgroundColor: Color.fromRGBO(215, 238, 242, 1),
      body: SafeArea(
        
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //image
              Image.asset('lib/images/logocrop.png',
                height: 200,
                width: 200,
              ),
              SizedBox(height: 10,),
              //title text
              Text('Crop Guard',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10,),
          
              //text
              Text(
                'Paddy health in your hands!',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 50,),
              //loading indicator
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(4, 53, 82, 1)),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}