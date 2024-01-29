// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';


class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
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

              //Coloured container
              Container(
                
                height: 620,
                width: 345,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(215, 238, 242, 0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  //logo image
                  Image.asset('lib/images/logocrop.png', width: 230, height: 230,),
                  SizedBox(height: 20,),
                  //title text
                  const Text(
                    'CropGuard', 
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  //SizedBox(height: 5,),
                  //sub text
                  Text(
                      'Now your paddy diseases can be found\n out easily in your hands!',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  SizedBox(height: 45,),
                        
                  //continue with google button
                  SignInButton(
                  buttonType: ButtonType.google,
                  buttonSize: ButtonSize.medium,
                  btnTextColor: Colors.grey,
                  btnColor: Colors.white,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 260,
                  ),
                  SizedBox(height: 15,),
                        
                  //continue with email button,
                  SignInButton(
                  buttonType: ButtonType.mail,
                  buttonSize: ButtonSize.medium,
                  btnTextColor: Colors.grey,
                  btnColor: Colors.white,
                  btnText: 'Continue with Email',
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 260,
                  ),
                  SizedBox(height: 15,),
                ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}