import 'package:cricket/model/match_detail.dart';
import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import "dart:convert";

class ScoreProvider with ChangeNotifier {
  List<MatchDetail> _matchList = [];
  List<String> _matchIdList = [];
  List<MatchDetail> get matchList {
    return [..._matchList];
  }

  void fetchData() async {
    String url =
        "https://cricapi.com/api/matches?apikey=EgZQBD8hhqPlR5AG1Yr20XpGmgB2";
    final response = await http.get(Uri.parse(url));
    final jsonData = json.decode(response.body);
    print(jsonData);
  }
}
