// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {

  final String imagePath;
  final String dname;
  final String ddescription;

  const MyCard({super.key, 
  
  required this.imagePath, 
  required this.dname, 
  required this.ddescription
  });

  @override
  Widget build(BuildContext context) {
    return Card(
              color: Color.fromRGBO(215, 238, 242, 0.5),
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                          
                    //image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(imagePath, 
                      width: 350, 
                      height: 220,
                      fit: BoxFit.fill),
                      ),
                    SizedBox(height: 8,),
                          
                    //name and description
                    Text(dname,
                      style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold,
                    ),),
                                      
                    SizedBox(height: 5,),

                    //description

                    SizedBox(
                      width: 340,
                      child: Text(
                      ddescription,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16,
                      ),
                      ),
                    ),

                    SizedBox(height: 20,),
                    
                  ],
                ),
              ),
            );
  }
}