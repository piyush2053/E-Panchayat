import 'dart:convert';


import 'package:e_panchayat/models/article_model.dart';
import 'package:http/http.dart' as http;


class News{

  List<ArticleModel> news  = [];

  Future<void> getNews() async{

    
    var url1 = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=e10691d0820a41fa90a0d820920ae919");
    http.Response response = await http.get(url1);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
           
            content: element["content"],
            
          );
          news.add(article);
        }

      });
    }
  }
}

class CategoryNewsClass{

  List<ArticleModel> news  = [];

  Future<void> getNews(String category) async{

    
    var url1 = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=e10691d0820a41fa90a0d820920ae919");
    http.Response response = await http.get(url1);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
           
            content: element["content"],
            
          );
          news.add(article);
        }

      });
    }
  }
}


