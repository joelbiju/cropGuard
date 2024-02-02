// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:crop_guard/pages/disease_page.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {

  final String cardNumber;
  final String cardTitle;
  final String cardDesc;

  const HomeCard({super.key, 
  required this.cardNumber, 
  required this.cardTitle, 
  required this.cardDesc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                height: 230,
                width: MediaQuery.of(context).size.width * 0.96,
                child: Card(
                  color: Color.fromRGBO(24, 103, 112, 1),
                  surfaceTintColor: Colors.transparent,
                  elevation: 0,
                  
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  // margin: EdgeInsets.all(15),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        //card number
                        Text(cardNumber,
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.w400,
                          color: Colors.white)),

                        SizedBox(height: 10,),
                    
                        //card title
                        Text(cardTitle,
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                    
                        SizedBox(height: 2,),
                    
                        //card description
                        Text(cardDesc,
                        textAlign: TextAlign.justify,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.w300,
                          color: Colors.white)),

                          GestureDetector(
                        onTap: () {
                        // Navigate to another page
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Diseases()),
                    );
                  },
                    child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'more',
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      ),
                    ),
                ),
            ),
                
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
              );
  }
}