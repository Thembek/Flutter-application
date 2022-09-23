import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uri/uri.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_main_application/pages/user.dart';
import 'package:flutter_main_application/pages/signup.dart';
import 'package:flutter_main_application/pages/dashboard.dart';
import 'package:flutter_main_application/variables/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  Future save() async {
    var res = await http.post(Uri.parse("http://localhost:8686/signin"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: <String, String>{
        'email': user.email,
        'password': user.password,
      }
    );
    print(res.body);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Navigator.push(context, new MaterialPageRoute(builder: (context) => Dashboard()));
  }

  User user = User('', '');
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.png'), 
          fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.only(left: 35, top: 130),
                child: Text(
                  'Welcome\nBack',
                  style: GoogleFonts.pacifico(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.blue,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: TextEditingController(text: user.email),
                              onChanged: (value) {
                                user.email = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty){
                                  return 'Please enter your email address.';
                                } else if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                                  return null;
                                } else {
                                  return 'Enter valid credential.';
                                }
                                
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "carter@gmail.com",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            TextFormField(
                              controller: TextEditingController(text: user.password),
                              onChanged:(value) {
                                user.password = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password.';
                                } else if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                                  return null;
                                } else {
                                  return 'Enter valid credential.';
                                }
                              },
                              style: TextStyle(color: Colors.black),
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign in',
                                  style: GoogleFonts.acme(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 27,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      save();
                                      
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(context, new MaterialPageRoute(builder: (context) => Signup()));
                                  }, 
                                  child: Text(
                                    'Sign Up',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18
                                    ),
                                  ),
                                  style: ButtonStyle(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
}