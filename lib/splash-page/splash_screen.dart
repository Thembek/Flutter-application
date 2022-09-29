// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_main_application/pages/signin.dart';
import 'package:flutter_main_application/onboard/onboard.dart';

int? isviewed;
class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override 
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => isviewed != 0 ? OnBoard() : Signin())));
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFFFFF), 
              Color(0x1AFFFFFF),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset('assets/images/younglings.png', height: 550.0, width: 550.0),
                
              ],
            ),
            CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 14, 92, 17)),
            ),
          ],
        ),
      ),
    );
  }
}