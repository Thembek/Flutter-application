import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_main_application/pages/user.dart';
import 'package:flutter_main_application/pages/signup.dart';
import 'package:flutter_main_application/pages/dashboard.dart';
import 'package:flutter_main_application/variables/constant.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  Future save() async {
    var res = await http.post("http://localhost:8686/signup", 
      headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      },
      body: <String, String>{
        'email': user.email,
        'password': user.password,
      }
    );
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
                            TextField(
                              controller: TextEditingController(text: user.email),
                              onChanged: (value) {
                                user.email = value;
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
                            TextField(
                              controller: TextEditingController(text: user.password),
                              onChanged:(value) {
                                user.password = value;
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
                                      _insertData(emailController.text, passwwordController.text);
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
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
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