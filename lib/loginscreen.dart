import 'package:e_panchayat/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';

import 'mainScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            Text(
              'Sign in to E-Panchayat and Continue',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(color: Colors.white, fontSize: 28),
            ),
            SizedBox(height: 20),
            Text(
              'Enter your email and password below to continue to the E-Panchayt App!',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(color: Colors.white, fontSize: 14),
            ),
            SizedBox(
              height: 50,
            ),
            buildTextField('Automatically Fetched from Google',Icons.account_circle),
             SizedBox(height: 30),
            buildTextField('Just Hit The Login to Continue',Icons.lock),
            SizedBox(height: 30),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () async{
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (_) => MainScreen()));
                    User firebaseUser;
                    firebaseAuth.signInWithEmailAndPassword(email: 'demo@gmail.com', password: 'piyush123').then((authResult){
                        setState(() {
                          firebaseUser = authResult.user;
                         
                        });
                        print(firebaseUser.email);
                         
                    });

                  },
                  color: logoGreen,
                  child: Text('Login',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  textColor: Colors.white,
                ),
                SizedBox(height: 20),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () async{
          

    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    final User user =(await firebaseAuth.signInWithCredential(credential)).user;
    return user;              
  },
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.google),
                      SizedBox(width: 10),
                      Text('Sign-in using Google',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                          
                    ],
    
                  ),
                  textColor: Colors.white,
                ),
                SizedBox(height: 100),
                _buildFooterLogo(),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  _buildFooterLogo(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/logo.png',
          height: 35,
        ),
        Text(' E-Panchayat',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal))],
    );
  }



  buildTextField(String labelText,IconData icon){
    return Container(
      decoration: BoxDecoration(
        
        color: secondaryColor,
        border: Border.all(color:Colors.grey)),
      child: TextField(
        
        decoration: InputDecoration(
          
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              labelText: labelText,
              labelStyle: TextStyle(color: Colors.grey[300],fontStyle: FontStyle.italic),
              
              icon: Icon(
                icon,
                color: Colors.white,
              ),
  
              border: InputBorder.none),
           
              style: TextStyle(color: Colors.white),

        ),
    );
  }
}


