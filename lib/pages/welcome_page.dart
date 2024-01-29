// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),

      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            SizedBox(height: 10,),
            //logo image
            Image.asset('lib/images/logocrop.png', width: 200, height: 200,),
            SizedBox(height: 10,),
            //title text
            const Text(
              'CropGuard', 
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            //sub text
            Text(
                'Now your paddy diseases can be found\n out easily in your hands!',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            SizedBox(height: 65,),
          
            //signin button
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(41, 166, 148, 1),
                  minimumSize: const Size(350, 45),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  ),
              ),
              child: const Text('Sign In', style: TextStyle(fontSize: 16, color: Colors.white),),
            ),
            SizedBox(height: 15,),
          
            //signup button
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                  elevation: 0.5,
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  minimumSize: const Size(350, 45),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.black, width: 0.3),
                  ),
              ),
              child: const Text('Sign Up', style: TextStyle(fontSize: 16, color: Colors.black),),
            ),
            ],
          ),
        ),
      ),
    );
  }
}