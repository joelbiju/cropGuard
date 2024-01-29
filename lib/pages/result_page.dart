// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyResult extends StatefulWidget {

  const MyResult({super.key,});

  @override
  State<MyResult> createState() => _MyResiltState();
}

class _MyResiltState extends State<MyResult> {
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

      backgroundColor: Color.fromRGBO(250,250,250,1),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            //result text
            Text('Results',
            style: TextStyle(
              color: Colors.black, 
              fontWeight:FontWeight.w500,
              fontSize: 20),
            ),

            //result card
            Card(
                color: Colors.green,
                surfaceTintColor: Colors.transparent,
                elevation: 0,

                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Disease Found:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        SizedBox(width: 5,),
                        Text('YES/NO', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                      ],
                    ),
                    SizedBox(height: 3,),

                    Row(
                      children: [
                        Text('Type of Disease:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                        SizedBox(width: 5,),
                        Text('Rice Blast', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                      ],
                    ),
                    SizedBox(height: 3,),

                    Row(
                      children: [
                        Text('Required Pesticide', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        SizedBox(width: 5,),
                        Text('Tricyclazole', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                      ],
                    ),
                    SizedBox(height: 3,),

                    Text('description',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[400],
                      ),),
                  ],
                ),
            ),
          ],
        ),
        
      ),
    );
  }
}