import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutternews/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutternews/main.dart';

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=37f411b8e7a24e2b9843b5f4ab728110");

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["context"]);
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];
  Future<void> getNews(String category) async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category"
        "&apiKey=37f411b8e7a24e2b9843b5f4ab728110");

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["context"]);
          news.add(articleModel);
        }
      });
    }
  }
}
