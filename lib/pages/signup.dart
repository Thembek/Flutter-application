// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:uri/uri.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_main_application/pages/user.dart';
import 'package:flutter_main_application/pages/dashboard.dart';
import 'package:flutter_main_application/pages/signin.dart';
import 'package:flutter_main_application/variables/constant.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  Future save() async {
    var res = http.post(Uri.parse('http://localhost:8686/signup'),
      headers: <String, String>{
        'Context-Type': 'application/json; charSet=UTF-8'
      },
      body: <String, String>{
        'email': user.email,
        'password': user.password,
      }
    );
    print(res);
    Navigator.push(context, new MaterialPageRoute(builder: (context) => Dashboard()));
  }

  User user = User('', '');

  bool passVisi = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Create an\nAccount',
                style: GoogleFonts.pacifico(
                  fontSize: 33,
                  color: Colors.white,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.28,
                ),
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
                              if(value == null || value.isEmpty) {
                                return 'Your email address, is required.';
                              } else if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                                return null;
                              } else {
                                return 'Enter valid credential';
                              }
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'carter@gmail.com',
                              prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black,),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          TextFormField(
                            controller: TextEditingController(text: user.password),
                            onChanged: (value) {
                              user.password = value;
                            },
                            validator: (value) {
                              if(value == null || value.isEmpty) {
                                return 'Your password is required.';
                              } else if(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                                return null;
                              } else {
                                return 'Enter valid credential.';
                              }
                            },
                            style: TextStyle(color: Colors.black),
                            obscureText: passVisi,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                icon: Icon(passVisi ? Icons.visibility_off : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    passVisi=!passVisi;
                                  });
                                },
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 16, 30, 0),
                            child: Container(
                              height: 50,
                              width: 400,
                              child: Container(
                                color: Colors.blue,
                                child: RawMaterialButton(
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),                        
                                  ),
                                  onPressed: () {
                                    save();
                                  },
                                  child: Text(
                                    "Signup",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Padding(
                            padding: EdgeInsets.fromLTRB(160, 0, 0, 0),
                            child: Row(
                              children: [
                                Text(
                                  "OR",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(65, 20, 0, 0),
                            child: Row(
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, new MaterialPageRoute(builder: (context) => Signin()));
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
          ],
        ),
      ),
    );
  }
}