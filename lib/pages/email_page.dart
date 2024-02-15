// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field

import 'package:crop_guard/util/button_main.dart';
import 'package:flutter/material.dart';

class EmailAccount extends StatefulWidget {
  const EmailAccount({super.key});

  @override
  State<EmailAccount> createState() => _EmailAccountState();
}

class _EmailAccountState extends State<EmailAccount> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isConfirmPasswordValid = false;
  String? errorText;
  bool _submitButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Create', 
        style: TextStyle(
          color: Colors.grey, 
          fontWeight:FontWeight.w500,
          fontSize: 18),),
        centerTitle: true,
      ),

      backgroundColor: Color.fromRGBO(248, 248, 248, 1),

      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('lib/images/email_form.png',
                  height: 200,
                  width: 200,
                ),
                Text('Create an account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 20,),
            
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 430,
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Enter your email',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _emailController,
                          onChanged: (value) {
                            setState(() {
                              _isEmailValid = value.isNotEmpty;
                            });
                          },
                          decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                          ),
                        ),
                        SizedBox(height: 20,),
                              
                        Row(
                          children: [
                            Text('Enter your password',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        
                        TextFormField(
                          controller: _passwordController,
                          onChanged: (value) {
                            setState(() {
                              _isPasswordValid = value.isNotEmpty;
                            });
                          },
                          decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                          )
                        ),
                        SizedBox(height: 20,),
                              
                        Row(
                          children: [
                            Text('Confirm your password',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),

                        TextFormField(
                          controller: _confirmPasswordController,
                          onChanged: (value) {
                            setState(() {
                              _isConfirmPasswordValid = value.isNotEmpty &&
                                  value == _passwordController.text;
                            });
                          },
                          decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.red,
                          ),
                          ),
                        ),
                        SizedBox(height: 40,),
            
                        Actbutton(btntext: 'Submit', 
                        onpressed: (){
                        })
                      ],
                    ),
                  ),
                ),
            
              ]),
          ),
        ),
      ),
    );
  }
}