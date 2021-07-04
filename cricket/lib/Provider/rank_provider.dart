import 'package:cricket/model/rank.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RankProvider with ChangeNotifier {
  List<Rank> _odiList = [];
  List<Rank> _t20List = [];
  List<Rank> _testList = [];
  List<Rank> get odiList {
    return [..._odiList];
  }

  List<Rank> get t20List {
    return [..._t20List];
  }

  List<Rank> get testList {
    return [..._testList];
  }

  Future<void> fetchRanking() async {
    String url =
        "https://cricket.sportmonks.com/api/v2.0/team-rankings?api_token=NUlW0GSBmh9JUDIxSN0zvaUWY3cm5PNqHE6z0fL3f2CPifyrvs3PWg3v2SZ6";
    final response = await http.get(Uri.parse(url));
    final jsonData = json.decode(response.body);
    final ranks = jsonData["data"] as List;
    for (int i = 0; i < 3; i++) {
      if (ranks[i]["type"] == "TEST") {
        List l = ranks[i]["team"];
        for (int i = 0; i < l.length; i++) {
          Rank r = new Rank(
              imageUrl: l[i]["image_path"],
              name: l[i]["name"],
              position: l[i]["position"]);
          _testList.add(r);
        }
      } else if (ranks[i]["type"] == "ODI") {
        List l = ranks[i]["team"];
        for (int i = 0; i < l.length; i++) {
          Rank r = new Rank(
              imageUrl: l[i]["image_path"],
              name: l[i]["name"],
              position: l[i]["position"]);
          _odiList.add(r);
        }
      } else if (ranks[i]["type"] == "T20I") {
        List l = ranks[i]["team"];
        for (int i = 0; i < l.length; i++) {
          Rank r = new Rank(
              imageUrl: l[i]["image_path"],
              name: l[i]["name"],
              position: l[i]["position"]);
          _t20List.add(r);
        }
      }
    }
    print(_odiList);
    print(_t20List);
    print(_testList);
    notifyListeners();
  }
}
