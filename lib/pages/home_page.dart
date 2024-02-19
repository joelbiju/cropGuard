// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:crop_guard/pages/camera_screen.dart';
import 'package:crop_guard/pages/disease_page.dart';
import 'package:crop_guard/util/button_main.dart';
import 'package:crop_guard/util/climate_card.dart';
import 'package:crop_guard/util/home_card.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  final String? firstName;

  const MyHome({super.key, this.firstName});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  
  final TextEditingController _timeController = TextEditingController();
  bool _showError=false;
  bool _isButtonEnabled = false;

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
          
                    SizedBox(height: 10,),
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
                    Text(widget.firstName ?? 'Farmer', style: TextStyle(
                    color: Colors.grey[600], 
                    fontWeight:FontWeight.w400,
                    fontSize: 20)
                    ),
                  ],
                ),
                
                SizedBox(height: 10,),
          
                //climate card
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(4, 53, 82, 1),
                  
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        
                        children: [
                          //location pin icon
                          Icon(Icons.location_on, color: Colors.white, size: 30,),
          
                          SizedBox(width: 5,),
          
                          //location using location service
                          Text('Chengannur, Kerala', style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),),
                        ],
                        
                      ),
          
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //location degree from location service
                          Text('28°C', style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),),
          
                          //raining cloud icon
                          Icon(Icons.cloudy_snowing, color: Colors.white, size: 40,),
                        ],
                      ),
          
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
                        children: [
                          //humidity column
                          CliCard(title: 'Humidity', amount: '80%'),
                          //preciptation column
                          CliCard(title: 'Precipitation', amount: '5.1ml'),
                          //pressure column
                          CliCard(title: 'Pressure', amount: '450hPa'),
                          //wind column
                          CliCard(title: 'Wind', amount: '5m/s'),
                        ],
                      ),
                    ],
                  ),
                  
                ),
                
                SizedBox(height: 20,),
                //carousel
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Various Plant Diseases',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),),
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
                          'See all',
                          style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          ),
                        ),
                    ),
                  ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          HomeCard(
                            cardNumber: '01', 
                            cardTitle: 'Rice Blast', 
                            cardDesc: "The rice blast disease, which is caused by a fungus Mangnaporthe oryzae known as one of the most formidable and economically impactful maladies affecting rice agriculture globally. With rice serving as a primary dietary staple for more than half of the world's population, this disease carries significant consequences."
                            ),
                          HomeCard(
                            cardNumber: '02', 
                            cardTitle: 'Bacterial Blight', 
                            cardDesc: "Bacterial blight, a concerning issue in rice cultivation, is attributed to the presence of the Xanthomonas oryzae, primarily affecting regions with warm and humid climates. It presents unique and easily recognizable visual indications."
                            ),
                          HomeCard(
                            cardNumber: '03', 
                            cardTitle: 'Brown Spot', 
                            cardDesc: "Brown spots on rice plants are a common symptom of various plant diseases. These spots typically appear as small to large discolored areas on the leaves, stems, or grains of the rice plant."
                            ),
                          HomeCard(
                            cardNumber: '04', 
                            cardTitle: 'Leaf Smut', 
                            cardDesc: "Leaf smut, in rice plants is the result of an infection by the Ustilaginoidea virens fungus. The disease is marked by the appearance of small, initially green to whitish spore balls on rice panicles, which subsequently change into smoky gray to dark green or black formations."
                            ),
                          HomeCard(
                            cardNumber: '05', 
                            cardTitle: 'Tungro', 
                            cardDesc: "Tungro is a viral disease of rice that is transmitted by leafhoppers. It is caused by two viruses: rice tungro spherical virus (RTSV) and rice tungro bacilliform virus (RTBV). This viral infection manifests in rice plants as leaf discoloration (yellowing or reddening), stunted growth leading to significant yield losses."
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 20,),
          
                Row(
                  children: [
                    Text('Area of Land',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        ),),
                  ],
                ),
                SizedBox(height: 8,),
          
                //land area option
                Container(
                  width: MediaQuery.of(context).size.width*0.92,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      child: SizedBox(
                                        height: 40,
                                        child: TextField(
                                          controller: _timeController,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value){
                                            bool isNumeric = double.tryParse(value) != null;
                                            setState(() {
                                              _isButtonEnabled = isNumeric;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'Area (in hectares)',
                                            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                                            errorText: _showError ? 'This field is necessary' : null,
                                          ),
                                        ),
                                      ), 
                                  ),
                                ),
                  
                                //submit button
                                ElevatedButton(
                                  onPressed: () {
                                    if (!_isButtonEnabled) {
                                    setState(() {
                                    _showError = true;
                                    });
                                    } else {
                                    // Handle submit logic here
                                    print('button pressed');
                                    setState(() {
                                    _showError = false;
                                    });
                                  }
                                }, 
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(41, 166, 148, 1)),
                                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                                    foregroundColor: MaterialStateProperty.all(Colors.white),
                                  ),
                                  child: Text('Submit'),
                                  ),
                                  SizedBox(width: 10,),
                    ],
                  ),
                ),
                
                
          
                //image upload button
          
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  width: 350,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
          
                  child: Column(
                    children: [
                      Text('Detect Plant Diseases', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),),
          
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //capture image
                          Actbutton(
                            btntext: 'Select Image', 
                            //send to camera screen
                            onpressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CameraScreen()),
                              );

                            }),
                        ],
                      ),
                    ],
                  ),
                ),
          
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