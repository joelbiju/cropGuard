// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:crop_guard/util/button_main.dart';
import 'package:crop_guard/util/popup_dialog.dart';
import 'package:flutter/material.dart';


class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {

  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _intensityController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  double pesticideAmount = 0.0;
  final FocusScopeNode _focusScopeNode = FocusScopeNode();
  
  @override
  void dispose() {
    _focusScopeNode.dispose();
    super.dispose();
  }

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
        title: const Text('Calculator', 
        style: TextStyle(
          color: Colors.grey, 
          fontWeight:FontWeight.w500,
          fontSize: 18),),
        centerTitle: true,
      ),

      backgroundColor: Color.fromRGBO(248, 248, 248, 1),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
                SizedBox(height: 20,),
                
                //text title
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('About:',
                  style: TextStyle(
                    color: Colors.black, 
                    fontWeight:FontWeight.w500,
                    fontSize: 20,
                  ),),
                ),
                SizedBox(height: 10,),
          
                //text description
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                
                  child: Text('You can effectively calculate the required amount of pesticide that needed for your farm land from some key data that you provide. With this, you can reduce overuse of pesticide. Use this calculator to calculate your amount calculation.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black, 
                    fontWeight:FontWeight.w400,
                    fontSize: 16,
                  ),),
                ),
          
                SizedBox(height: 25,),

                //card with details
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    color: Color.fromRGBO(215, 238, 242, 0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    surfaceTintColor: Colors.transparent,
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          Text('Calculate Pesticide',
                          style: TextStyle(
                            color: Colors.black, 
                            fontWeight:FontWeight.w500,
                            fontSize: 20,
                          ),),
                      
                          SizedBox(height: 10,),
                      
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text('Area of land (in hectares):',
                              style: TextStyle(
                                color: Colors.black, 
                                fontWeight:FontWeight.w400,
                                fontSize: 18,
                              ),),
                              SizedBox(width: 20,),
                      
                              //textfield for area
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: SizedBox(
                                    height: 40,
                                    child: TextField(
                                      controller: _areaController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: '20',
                                        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5))
                                      ),
                                    ),
                                  ), 
                              ),
                            ), 
                            ],
                          ),
                      
                          SizedBox(height: 10,),
                      
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text('Intensity of Disease (0/1):',
                              style: TextStyle(
                                color: Colors.black, 
                                fontWeight:FontWeight.w400,
                                fontSize: 18,
                              ),),
                              SizedBox(width: 20,),
                      
                              //textfield for intensity of disease
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: SizedBox(
                                    height: 40,
                                    child: TextField(
                                      controller: _intensityController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: '0/0.5/1',
                                        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5))
                                      ),
                                    ),
                                  ), 
                              ),
                            ), 
                            ],
                          ),

                          SizedBox(height: 10,),


                          //for run time
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text('Intensity of Disease (0/1):',
                              style: TextStyle(
                                color: Colors.black, 
                                fontWeight:FontWeight.w400,
                                fontSize: 18,
                              ),),
                              SizedBox(width: 20,),
                      
                              //textfield
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: SizedBox(
                                    height: 40,
                                    child: TextField(
                                      controller: _timeController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: '5 (in minutes)',
                                        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5))
                                      ),
                                    ),
                                  ), 
                              ),
                            ), 
                            ],
                          ),
                      
                          SizedBox(height: 55,),
                      

                          //calculate button
                          Actbutton(
                            btntext: 'Find Result',
                  
                            onpressed: () {
                  
                              FocusManager.instance.primaryFocus?.unfocus();
                  
                  
                              double area= double.tryParse(_areaController.text) ?? 0.0;
                              double intensity = double.tryParse(_intensityController.text) ?? 0.0;
                  
                              setState(() {
                              pesticideAmount = area * 80 * intensity;
                            });

                            //show pop up dialogue
                            showDialog(
                              context: context, 
                              builder: (BuildContext context){
                                return MyDialog(
                                  dialogTitle: 'Result', 
                                  dialogText: 'Required Pesticide Amount', 
                                  dialogResult: '$pesticideAmount litres');
                              } 
                            );
                          },
                          ),
                        
                        SizedBox(height: 30,),
                  
                        //result text
                        Text('Required Pesticide Amount: $pesticideAmount litres',
                        style: TextStyle(
                            color: Colors.black, 
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          ),
                          SizedBox(height: 15,)
                        ],
                      ),
                    ),
                  ),
                ),
          
          
          ]),
        ),
      ),
    );
  }
}