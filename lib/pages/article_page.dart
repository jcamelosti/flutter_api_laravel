import 'dart:convert';
import 'dart:convert' as convert;
import 'package:appapi/api/my_api.dart';
import 'package:appapi/models/get_article_info.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  //var articles = <ArticleInfo>[];
  //var allarticles = <ArticleInfo>[];
  late List<ArticleInfo> articles;

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
      Iterable l = json.decode(response.body);
      articles = List<ArticleInfo>.from(l.map((model)=> ArticleInfo.fromJson(model)));
      debugPrint(articles.length.toString());
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
      body: Column(
        children: const [
          Text("oi"),
        ],
      ),
    );
  }
}
