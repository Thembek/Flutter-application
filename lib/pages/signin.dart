import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_main_application/pages/user.dart';
import 'package:flutter_main_application/pages/dashboard.dart';
import 'package:flutter_main_application/variables/constant.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GloabalKey<FormState>();
  Future save() async {
    var res = await http.post("http://localhost:8686/sigin",
      headers: <String, String>{
        'Content-Type': 'application/json;charSet=UTF-8'
      },
      body: <String, String>{
        'email': user.email,
        'password': user.password,
      } 
    );
    print(res.body);
    Navigator.push(
      context, new MaterialPageRoute(builder: (context) => )
    );
  }

  User user = User('', '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SvgPicture.asset(
              'assets/images/top.svg',
              width: 400,
              height: 150,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Text(
                    "Signin",
                    style: GoogleFonts.pacifico(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: TextEditingController(text: user.email),
                      onChanged: (value) {
                        user.email = value;
                      },
                      validator: (value) {
                        if (value.isEmpty){
                          return 'Enter something';
                        } else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                          return null;
                        } else {
                          return 'Enter valid email';
                        }
                      },
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        hintText: 'carter@gmail.com',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: TextEditingController(text: user.email),
                      onChanged: (value) {
                        user.email = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Something';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.blue,
                        ),
                        hintText: 'Password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.blue)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.blue)
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.red)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(55, 16, 16, 0),
                    child: Container(
                      height: 50,
                      width: 400,
                      child: FlatButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            save();
                          } else {
                            print("Invalid user credentials.")
                          }
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(95, 20, 0, 0),
                    child: Row(
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(builder: (context) => Signup()),
                            );
                          },
                          child: Text(
                            'Sign up',
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
          ),
        ],
      ),
    );
  }


}