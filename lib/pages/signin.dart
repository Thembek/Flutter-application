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
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();

  bool passVisi = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/younglings.png',
                  fit: BoxFit.contain,
                  width: 250,
                ),
              ),
              SizedBox(height: 150,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(       
                      style: TextStyle(
                      color: Colors.black
                      ),
                      decoration: InputDecoration(
                        hintText: 'carter@gmail.com',
                        prefixIcon: Icon(Icons.email_outlined, color: Colors.blueGrey),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(       
                      style: TextStyle(
                      color: Colors.black
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                        icon: Icon(passVisi ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              passVisi = !passVisi;
                            });
                          }
                        ),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15.0),
                      fixedSize: Size(250, 50),
                      backgroundColor: Colors.green[900],
                      textStyle: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ), 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text("Login"),
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(height: 25.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Text(
                      "signup",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
