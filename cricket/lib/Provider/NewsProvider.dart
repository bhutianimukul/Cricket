import 'package:cricket/model/news.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

class NewsProvider with ChangeNotifier {
  List<News> _newsList = [];
  List<News> get newsList {
    return [..._newsList];
  }

  Future<void> fetchNews() async {
    _newsList.clear();
    final url =
        "https://newsapi.org/v2/everything?q=cricket AND Cricket AND game&apiKey=13f96319dae94b739e554e8dad8d676a&qInTitle=Cricket AND Sports";
    final response = await http.get(Uri.parse(url));
    final jsonData = json.decode(response.body);
    print(jsonData);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'].length != 0 &&
            element["url"].length != 0 &&
            element["title"].length != 0 &&
            element["description"].length != 0) {
          _newsList.add(News(
              author: "",
              publishedAt: DateTime.parse(element['publishedAt']),
              url: element["url"],
              title: element["title"],
              imageUrl: element['urlToImage'],
              description: element['description']));
        }
      });
    }

    notifyListeners();
  }
}
