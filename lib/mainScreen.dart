import 'package:flutter/material.dart';
import 'drawerScreen.dart';
import 'homeScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
        children: [
          DrawerScreen(),
          HomeScreen()

     ], ) 
    );
  }
}