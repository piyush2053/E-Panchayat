

import 'package:e_panchayat/Interact/complaint.dart';
import 'package:e_panchayat/Interact/suggestion.dart';
import 'package:e_panchayat/loginscreen.dart';
import 'package:e_panchayat/mainScreen.dart';
import 'package:e_panchayat/news.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Services extends StatefulWidget {
  
  @override
  _ServicesState createState() => _ServicesState();
}
  
Color primaryColor = Color(0xff18203d);
Color secondaryColor = Color(0xff232c51);
Color logoGreen = Color(0xff25bcbb);


class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: secondaryColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (_) => MainScreen()));
                  },
                ),
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.home),
                          color: Colors.transparent,
                          onPressed: () {
                           
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.home),
                          color: Colors.white,
                          onPressed: () {
                             Navigator.push(context,MaterialPageRoute(builder: (_) => MainScreen()));
                          },
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Menu',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('( मेन्यू )',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 20.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 48.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView(children: [
                          _buildItem('assets/news.png', 'Live News', 'दैनिक समाचार यहाँ\nसे प्राप्त करें'),
                          _buildItem('assets/suggest.png', 'Suggestion Box', 'अपनी राय दे !\nऔर योगदान करे'),
                          _buildItem('assets/complaint.png', 'Raise A Complaint', 'शिकायत दर्ज़ करे\nऔर समाधान पाए'),
                         
                        ]))),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Text('© E-Panchayat ,An initiative to make livelyhood better.'),
                      height: 45.0,
                      width: 250.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                  
                  
                    ),
                   
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItem(String imgPath, String sname, String price) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
          onTap: () {
            if(sname =='Live News'){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => News()
            ));
            }
            if(sname == 'Suggestion Box'){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Suggest()
            ));
            }
            if(sname == 'Raise A Complaint')
            {
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Complaint()
            ));
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  children: [
                    Hero(
                      tag: imgPath,
                      child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0
                      )
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text(
                          sname,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        Text(
                       price,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.grey
                          )
                        )
                      ]
                    )
                  ]
                )
              ),
              IconButton(
                icon: Icon(Icons.arrow_right),
                color: Colors.black,
                onPressed: () {}
              )
            ],
          )
        ));
    
    
  }
}
 

 _sendMail() async {
    
    const uri =
        'mailto:councilvijaywada@gmail.com?subject=subject(E-Panchayat)&body=Body(E-panchayat)';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
