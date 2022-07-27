import 'package:flutter/material.dart';

import '../helper/newsData.dart';
import '../module/Post.dart';

class NewsDetails extends StatefulWidget {
  // const NewsDetails({Key? key}) : super(key: key);
  late int number ;
  NewsDetails({required this.number});
  @override
  State<NewsDetails> createState() => _NewsDetailsState(num: number);
}

class _NewsDetailsState extends State<NewsDetails> {
  late int num;
  _NewsDetailsState({required this.num});
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
    // print("ds");

    getNews();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("AKHBARK"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(57, 118, 193, 100),
      ),
      body: _loading ? Center(
        child: CircularProgressIndicator(
          color: Color.fromRGBO(57, 118, 193, 100),
        ),
      ):Column(
        children: [
          Container(
            // transformAlignment: AlignmentDirectional.center,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(8.0),
            child: Text(
              articles[num].title,
              style: TextStyle(
                fontSize: 26,
                color: Colors.blueGrey[700],
                fontWeight: FontWeight.bold,
              ), //Textstyle
            ),
          ), //SizedBox
          Text(
            articles[num].author,
            style: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(96, 125, 139, 100),
            ), //Textstyle
          ),//Text
          const SizedBox(
            height: 10,
          ), //SizedBox

          Center(
            child: Image.network(articles[num].urlToImage),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              articles[num].desc,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 15,
                color: Color.fromRGBO(96, 125, 139, 100),
              ), //Textstyle
            ),
          ),
        ],
      ),
    );
  }
}
