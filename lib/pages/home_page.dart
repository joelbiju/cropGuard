// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.person_2_rounded, color: Colors.black,),
          onPressed: () {
          },
        ),
        title: const Text('Home', 
        style: TextStyle(
          color: Colors.grey, 
          fontWeight:FontWeight.w500,
          fontSize: 18),),
        centerTitle: true,
      ),

      backgroundColor: Color.fromRGBO(248, 248, 248, 1),

      body: SafeArea(
        child: Column(
          children: [

            //welcome note
            Row(
              children: [
                Text('Welcome,', style: TextStyle(
                color: Colors.black, 
                fontWeight:FontWeight.w500,
                fontSize: 20)
                ),
              ],
            ),
            Row(
              children: [
                Text('Farmer', style: TextStyle(
                color: Colors.black, 
                fontWeight:FontWeight.w500,
                fontSize: 20)
                ),
              ],
            ),

            SizedBox(height: 20,),

            //carousel
            

          ],
        ), 
        ),
    );
  }
}