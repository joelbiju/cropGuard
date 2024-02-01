// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {

  final String dialogTitle;
  final String dialogText;
  final String dialogResult;
  const MyDialog({super.key, 
  required this.dialogTitle, 
  required this.dialogText, 
  required this.dialogResult});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                backgroundColor: Colors.white,
                contentPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  ),
                content: Container(
                  height: 200,
                  width: 300,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(dialogTitle, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Text(dialogText, style: TextStyle(fontSize: 18,),),
                    SizedBox(height: 5,),
                    Text(dialogResult, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    SizedBox(height: 25,),
                    //button to close dialogue
                    GestureDetector(
                      onTap: () {
                          Navigator.pop(context);
                        },
                      child: Text('Close',
                      style: TextStyle(
                      color: Color.fromRGBO(41, 166, 148, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      ),),
                    )
                                    
                  ],
              ),
            ),
                                  
        );
  }
}