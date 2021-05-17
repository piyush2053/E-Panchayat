import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'loginscreen.dart';

void main() {
  runApp(MaterialApp(home: HomePage(),));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class _HomePageState extends State<HomePage> {
  

Color primaryColor = Color(0xff18203d);
Color secondaryColor = Color(0xff232c51);
Color logoGreen = Color(0xff25bcbb);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      backgroundColor: primaryColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //We take the image from the assets
                  Image.asset(
                    'assets/splash.gif',
                    height: 250,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Texts and Styling of them
                  Text(
                    'Welcome To E-Panchayat',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'A Platform To Interact With the Whole Village An Application For Your Own Village !',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //Our MaterialButton which when pressed will take us to a new screen named as 
                  //LoginScreen
                  MaterialButton(
                    elevation: 0,
                    height: 50,
                    onPressed: () {
                      Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                    },
                    color: logoGreen,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Get Started',
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18)),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    textColor: Colors.white,
                  )
                ],
              ),
      ),
    );
  }
}


