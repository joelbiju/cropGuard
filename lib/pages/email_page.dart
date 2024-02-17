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
      
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Image.asset('lib/images/email_form.png',
                  height: 200,
                  width: 250,
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
                    color: Color.fromRGBO(215, 238, 242, 0.5),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.03),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
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
                          errorText: _submitButtonClicked && !_isEmailValid? 'This field is required' : null,
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
                          errorText: _submitButtonClicked && !_isPasswordValid ? 'This field is required' : null,
                          ),
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
                          errorText: _submitButtonClicked && !_isConfirmPasswordValid ? 'Passwords do not match': null,
                          ),
                        ),
                        SizedBox(height: 40,),
            
                        Actbutton(btntext: 'Submit', 
                        onpressed: (){
                          setState(() {
                              _submitButtonClicked = true;
                            });
                          if (_isEmailValid &&
                                _isPasswordValid &&
                                _isConfirmPasswordValid) {
                              // All fields are valid, proceed with submission
                              print('valid submit');
                              // Your submission logic here
                            } else {
                              // Some fields are invalid, handle accordingly
                              print('invalid submit');
                            }
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