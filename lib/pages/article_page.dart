import 'dart:convert';
import 'dart:convert' as convert;
import 'package:appapi/api/my_api.dart';
import 'package:appapi/components/text_widget.dart';
import 'package:appapi/models/get_article_info.dart';
import 'package:appapi/pages/detail_book.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late List<ArticleInfo> articles = [];
  //late List<ArticleInfo> allarticles = [];

  @override
  void initState() {
    _getArticles();
    super.initState();
  }

  _getArticles() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString("user");

/*
    if(user!=null){
    var userInfo=jsonDecode(user);
      debugPrint(userInfo);
    }else{
      debugPrint("no info");
    }*/
    await _initData();
  }

  _initData() async {
    /*await CallApi().getPublicData("welcomeinfo").then((response) {
      setState(() {
        /*Iterable list = json.decode(response.body);
        articles= list.map((model)=>ArticleInfo.fromJson(model)).toList();*/
        String json = utf8.decode(response.bodyBytes);
        articles = ArticleInfo.fromJson(convert.json.decode(json))
            as List<ArticleInfo>;
        print(articles.toString());
      });
    });

    await CallApi().getPublicData("welcomeinfo").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        allarticles = list.map((model) => ArticleInfo.fromJson(model)).toList();
      });
    });*/

    await CallApi().getPublicData("welcomeinfo").then((response) {
      setState(() {
        Iterable l = json.decode(response.body);
        articles = List<ArticleInfo>.from(l.map((model)=> ArticleInfo.fromJson(model)));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: const Color(0xFFffffff),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
              child: articles.length == 0
                  ? const CircularProgressIndicator()
                  : Column(
                children: articles.map((article) {
                  debugPrint(article.img.toString());
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailBookPage(
                                    articleInfo: article, index: 0)));
                      },
                      child: Container(
                          padding:
                          const EdgeInsets.only(left: 20, right: 20),
                          height: 250,
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 35,
                                  child: Material(
                                      elevation: 0.0,
                                      child: Container(
                                        height: 180.0,
                                        width: width * 0.9,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(0.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                offset:
                                                const Offset(0.0, 0.0),
                                                blurRadius: 20.0,
                                                spreadRadius: 4.0)
                                          ],
                                        ),
                                        // child: Text("This is where your content goes")
                                      ))),
                              Positioned(
                                  top: 0,
                                  left: 10,
                                  child: Card(
                                      elevation: 10.0,
                                      shadowColor:
                                      Colors.grey.withOpacity(0.5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(15.0),
                                      ),
                                      child: Container(
                                          height: 200,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                10.0),
                                            /*image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  "https://ferramentasdemkt.com.br/uploads/${article.img}"),
                                            ),*/
                                          )))),
                              Positioned(
                                  top: 45,
                                  left: width * 0.4,
                                  child: Container(
                                      height: 200,
                                      width: 150,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                              text: article.title,
                                              fontSize: 20,
                                              color: Colors.grey),
                                          TextWidget(
                                              text: "Author: Mike Ahmed",
                                              fontSize: 16),
                                          const Divider(color: Colors.black),
                                          TextWidget(
                                              text: article.description,
                                              fontSize: 16,
                                              color: Colors.grey),
                                        ],
                                      ))),
                            ],
                          )));
                }).toList(),
            ),
          ),
    );
  }
}
