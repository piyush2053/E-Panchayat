
import 'package:e_panchayat/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_panchayat/configuration.dart';
import 'package:e_panchayat/screen2.dart';




class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
Color secondaryColor = Color(0xff232c51);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)..rotateY(isDrawerOpen? -0.5:0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.grey[200],

          borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0)

      ),
      child: SingleChildScrollView(
        
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 isDrawerOpen?IconButton(
                   icon: Icon(Icons.arrow_back_ios),
                   onPressed: (){
                     setState(() {
                       xOffset=0;
                       yOffset=0;
                       scaleFactor=1;
                       isDrawerOpen=false;

                     });
                   },

                 ): IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        setState(() {
                          xOffset = 230;
                          yOffset = 150;
                          scaleFactor = 0.6;
                          isDrawerOpen=true;
                        });
                      }),
                  Column(
                    children: [
                      Text('Location'),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: secondaryColor,
                          ),
                          Text('Vijay Wada ,Madhya Pradesh'),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://i.pinimg.com/564x/2f/61/9b/2f619bedcb4563bed84a0cf3fa970792.jpg'),
                    backgroundColor: Colors.grey[300],
                  )
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              margin: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
        elevation: 0,
        
        height: 45,
        color: secondaryColor,
        
        child: new Text('Menu ( मेन्यू )',
            style: new TextStyle(fontSize: 22.0, color: Colors.white,fontFamily: 'Montserrat',)),
        onPressed: () {
          
           Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Services()));
        }
      )
                ],
              ),
            ),

            Container(height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context,index){
                return Container(
                  child: Column(
                    children: [
                      Container(

                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: shadowList,
                          borderRadius: BorderRadius.circular(20)
                          
                        ),
                        
                        child: Image.asset(categories[index]['iconPath'],
                        height: 60,width: 60),
                      ),
                      Text(categories[index]['name'],)
                    ],
                  ),
                );
              },

            ),
            ),


            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));

              },
              child: Container(
                height: 230,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: secondaryColor,
                            borderRadius: BorderRadius.circular(20),
                              boxShadow: shadowList,
                            ),
                            margin: EdgeInsets.only(top: 50),
                          ),
                          Align(
                            child: Hero(
                                tag:1,child: Image.asset('assets/sarpanch.png')),
                          )

                        ],
                      ),
                    ),
                    Expanded(child: Container(
                      margin: EdgeInsets.only(top: 60,bottom: 50,left: 4),
                      child:new Text('Kailash Singh Sisodia\n( सरपंच )\n VijayWada,\n(M.P)',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Sans'),),
                      decoration: BoxDecoration(color: Colors.grey[100],
                      boxShadow: shadowList,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)

                        )
                      ),

                    ))
            

                  ],
                ),

              ),
            ),
            Container(
              height: 240,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: secondaryColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: shadowList,
                          ),
                          margin: EdgeInsets.only(top: 50),
                        ),
                        Align(
                          child: Image.asset('assets/cm.png'),
                        )

                      ],
                    ),
                  ),
                  Expanded(child: Container(
                        child:new Text('Shivraj Singh Chouhan\nChief Minister Madhya Pradesh\n181',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Sans'),),
                        
                    margin: EdgeInsets.only(top: 60,bottom: 60,left: 4),
                    decoration: BoxDecoration(color: Colors.grey[100],

                        boxShadow: shadowList,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)

                        )
                    ),

                  ))

                ],
              ),

            ),
            SizedBox(height: 50,)

          ],
        ),
      ),
    );
  }
}

