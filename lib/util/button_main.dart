// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Actbutton extends StatelessWidget {

  final String btntext;
  final VoidCallback onpressed;
  const Actbutton({super.key, required this.btntext, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    
                    //onpressed function to get,
                    onPressed: onpressed,
                    
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(41, 166, 148, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: Text(btntext, 
                    style: TextStyle(fontSize: 18, 
                    color: Colors.white),),),
                );
  }
}