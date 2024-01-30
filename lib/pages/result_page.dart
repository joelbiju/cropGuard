// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:crop_guard/util/button_main.dart';

class MyResult extends StatefulWidget {

  final String dfound;
  final String dtype;
  final String dpesticide;
  final String ddescription;

  const MyResult({super.key, 
  required this.dfound, 
  required this.dtype, 
  required this.dpesticide, 
  required this.ddescription,
  });

  @override
  State<MyResult> createState() => _MyResultState();
}

class _MyResultState extends State<MyResult> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      //appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Result', 
        style: TextStyle(color: Colors.black, fontWeight:FontWeight.w500),),
        centerTitle: true,
      ),

      backgroundColor: Color.fromRGBO(248, 248, 248, 1),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(height: 20,),
            //result text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Results Obtained',
              style: TextStyle(
                color: Colors.black, 
                fontWeight:FontWeight.w500,
                fontSize: 20),
              ),
            ),
        
            //result card
            Card(
                color: Colors.white,
                surfaceTintColor: Colors.transparent,
                elevation: 0,
        
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Disease Found:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          SizedBox(width: 45,),
                          Text(widget.dfound, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                        ],
                      ),
                      SizedBox(height: 3,),
                  
                      Row(
                        children: [
                          Text('Type of Disease:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                          SizedBox(width: 35,),
                          Text(widget.dtype, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                        ],
                      ),
                      SizedBox(height: 3,),
                  
                      Row(
                        children: [
                          Text('Required Pesticide', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          SizedBox(width: 15,),
                          Text(widget.dpesticide, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                        ],
                      ),
                      SizedBox(height: 10,),
        
                      Row(
                        children: [
                          Text('Details:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                        ],
                      ),

                      SizedBox(height: 5,),

                      Text(widget.ddescription,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[800],
                        ),),
                    ],
                  ),
                ),
            ),

            SizedBox(height: 15,),
            
            //Pesticide text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Pesticide Initiation', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
              ],
            ),

            SizedBox(height: 10,),
            
            //pesticide initiation button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Actbutton(btntext: 'Initiate Pesticide',),
              ],
            )
          ],
        ),
        
      ),
    );
  }
}