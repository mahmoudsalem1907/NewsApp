import 'dart:convert';
// import 'dart:html';

import 'package:testa5er/module/Post.dart';
import 'package:http/http.dart';

class News {
  List<Post> datatobesavedin = [];

  Future<void> getNews() async{

    var response =await get(Uri.parse("https://newsapi.org/v2/everything?q=tesla&from=2022-06-27&sortBy=publishedAt&apiKey=33bf4443df8d4d31b9fec38928b5024f"));
    var jsonData = jsonDecode(response.body);
    print(jsonData);

    if (jsonData['status'] == 'ok') {

      jsonData['articles'].forEach((element) {


        if (element['urlToImage']!=null && element['description']!=null) {

          // initliaze our model class

          Post articleModel = Post(
            title: element['title']??"",
            urlToImage: element['urlToImage']??"",
            desc: element['description']??"",
            author: element['author']??"",
          );


          datatobesavedin.add(articleModel);


        }


      });

    }


    
  }

}