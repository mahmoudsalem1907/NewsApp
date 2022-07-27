import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testa5er/module/Post.dart';
import 'package:testa5er/helper/newsData.dart';
import 'package:testa5er/pages/newsdetails.dart';
// import 'package:http/http.dart' as http;
// import 'package:login_news/modules/post_model.dart';

// Future<List<Post>> fetchPost() async {
//   final response =
//   await http.get(Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2022-06-26&sortBy=publishedAt&apiKey=API_KEY'));
//
//   if (response.statusCode == 200) {
//     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
//
//     return parsed.map<Post>((json) => Post.fromMap(json)).toList();
//   } else {
//     throw Exception('Failed to load album');
//   }
// }

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  // late Future<List<Post>> futurePost;

  // @override
  // void initState() {
  //   super.initState();
  //   futurePost = fetchPost();
  // }

  List<Post> articles = <Post>[];
  bool _loading = true;

  getNews() async {
    News newsdata = News();
    await newsdata.getNews();
    articles = newsdata.datatobesavedin;
    print("${articles.length}  this is length");
    setState(() {
      _loading = false;
    });


  }


  @override
  void initState() {
    super.initState();
    print("ds");

    getNews();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("AKHBARK"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(57, 118, 193, 100),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
            child: IconButton(
              icon: const Icon(Icons.category_outlined, size: 30.0),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body:Container(
        color: Colors.white24,
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: articles.length,
          itemBuilder: (context,index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsDetails(number: index)));
              },
              child: Container(
// height: 50,
// color: Colors.amber,
                  child: Center(
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.black,
                      color: Colors.white,
                      child: SizedBox(
// width: 300,
// height: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              Container(
                                  child: Image.network(articles[index].urlToImage,)),

                              const SizedBox(
                                height: 1,
                              ), //SizedBox
                              Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child:Column(
                                    children: [
                                      Text(
                                        articles[index].title,
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.blueGrey[700],
                                          fontWeight: FontWeight.w500,
                                        ), //Textstyle
                                      ), //Text
                                      const SizedBox(
                                        height: 10,
                                      ), //SizedBox
                                      Text(
                                        articles[index].desc,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromRGBO(96, 125, 139, 100),
                                        ), //Textstyle
                                      ),
                                    ],
                                  )) //SizedBox
//SizedBox
                            ],
                          ), //Column
                        ), //Padding
                      ), //SizedBox
                    ), //Card),
                  )),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      ),
    );
  }
}

