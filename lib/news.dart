import 'package:e_panchayat/configuration.dart';
import 'package:e_panchayat/models/article_model.dart';
import 'package:e_panchayat/views/news_home.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  List<ArticleModel> get news => null;

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       title: 'News',
      theme: ThemeData(
      primaryColor: secondaryColor,
      
      ),
      home: NewsHome(),
      
    );
  }
}