// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CliCard extends StatelessWidget {

  final String title;
  final String amount;

  const CliCard({super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          color: Colors.black.withOpacity(0.05),
                          elevation: 0,
                          
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Text(title, style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),),
                                Text(amount, style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),),
                              ],
                            ),
                          ),
                        );
  }
}