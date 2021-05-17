import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

  Color secondaryColor = Color(0xff232c51);
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

List<Map> categories = [
  {'name': 'Kamlesh\nGour', 'iconPath': 'assets/p1.png'},
  {'name': 'Suresh\nDeewan', 'iconPath': 'assets/p2.png'},
  {'name': 'Arjun\nSingh', 'iconPath': 'assets/p3.png'},
  {'name': 'Pawan\nTomar', 'iconPath': 'assets/p4.png'},
  {'name': 'Sukhdev\nsingh', 'iconPath': 'assets/p5.png'}
];

List<Map> drawerItems=[
  {
    'icon': FontAwesomeIcons.circle,
    'title' : '- Benefits -'
  },
  {
    'icon': Icons.circle,
    'title' : 'Complaint\nRegister'
  },
  {
    'icon': FontAwesomeIcons.circle,
    'title' : 'Give An\nSuggestion'
  },
  {
    'icon': Icons.circle,
    'title' : 'Call Sarpanch'
  },
  {
    'icon': Icons.circle,
    'title' : 'Can Message\nSarpanch'
  },
  {
    'icon': FontAwesomeIcons.circle,
    'title' : 'Many More'
  },
];