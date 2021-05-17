import 'package:e_panchayat/mainScreen.dart';
import 'package:flutter/material.dart';

class Complaint extends StatefulWidget {
  @override
  _ComplaintState createState() => _ComplaintState();
}

Color secondaryColor = Color(0xff232c51);

class _ComplaintState extends State<Complaint> {

  
final myController1 = TextEditingController();
  
  @override
  void dispose() {
    
    myController1.dispose();
    super.dispose();
  }
_clearText(){
 
   myController1.clear();
 
  }
  buildTextField(String labelText, IconData icon) {
  return Container(
    height: 200,
    decoration: BoxDecoration(
        color: Colors.transparent, border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10)),
    child: TextField(
 keyboardType: TextInputType.multiline,
  maxLines: null,
  
      controller: myController1,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: labelText,
          
          hintText: 'अंत में अपना मोबाइल नंबर और नाम जोड़ें |',
          labelStyle: TextStyle(
              color: Colors.blue[300],
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic),
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          border: InputBorder.none),
          
      style: TextStyle(color: Colors.black),
      
    ),
  );
}

 

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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MainScreen()));
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
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.home),
                          color: Colors.white,
                          onPressed: () {
                           //mail send karna hai yahan 
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
                Text('Complaint',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('( शिकायत )',
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
                          buildTextField('Enter Complaint', Icons.people),
                          SizedBox(height: 10,),
                          MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0))),
                              elevation: 1,
                              minWidth: 330.0,
                              height: 45,
                              color: Colors.blue[300],
                              child: new Text('Submit ( भेजे )',
                                  style: new TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                  )),
                              onPressed: () {
                                _clearText();
                               showDialog(
                                 context: context, builder: (context){
                                        Future.delayed(Duration(seconds: 5), () {
                          Navigator.of(context).pop(true);
                        });
                                 return AlertDialog(
                                   shape: RoundedRectangleBorder(borderRadius: 
    BorderRadius.all(Radius.circular(15))),
    title: Text('Your Complaint is sent successfully !'),
    content: Container(child: Image.asset('assets/sent.gif'),),
                                   
                                   
                                   
                                   );
                               });
                              })
                        ]))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Text(
                          '© E-Panchayat ,An initiative to make livelyhood better.'),
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
}




