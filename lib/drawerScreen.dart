import 'package:e_panchayat/main.dart';
import 'package:e_panchayat/services.dart';
import 'package:flutter/material.dart';
import 'package:e_panchayat/configuration.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}
Color secondaryColor = Color(0xff232c51);

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: secondaryColor,
      padding: EdgeInsets.only(top:50,bottom: 70,left: 10),
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://i.ibb.co/yY162sc/logo.png'),
                backgroundColor: secondaryColor,
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('E-Panchayat',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('1800-180-1551',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),

          Column(
            children: drawerItems.map((element) => Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Icon(element['icon'],color: Colors.white,size: 30,),
                  SizedBox(width: 12,),
                  Text(element['title'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                ],
                          
              ),
            )).toList(),
          ),

          Row(
            children: [
               IconButton(icon: Icon(Icons.room_service),color: Colors.white, onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Services()));
                    
                  }),
              SizedBox(width: 0,),
              Text('Services',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Container(width: 2,height: 20,color: Colors.white,),
              IconButton(icon: Icon(Icons.logout),color: Colors.white, onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (_) => HomePage()));
                    
                  }),
              SizedBox(width: 0,),
              Text('Log out',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)


            ],

          )


        ],
      ),

    );
  }
}