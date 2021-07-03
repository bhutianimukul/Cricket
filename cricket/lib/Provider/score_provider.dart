import 'package:cricket/model/match_detail.dart';
import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import "dart:convert";

class ScoreProvider with ChangeNotifier {
  List<MatchDetail> _matchList = [];
  List<List<String>> _matchIdList = [];

  List<MatchDetail> get matchList {
    return [..._matchList];
  }

  Future<void> fetchData() async {
    _matchList.clear();
    _matchIdList.clear();
    String url =
        "https://cricapi.com/api/matches?apikey=EgZQBD8hhqPlR5AG1Yr20XpGmgB2";
    final response = await http.get(Uri.parse(url));
    final jsonData = json.decode(response.body);

    List jsonDataMatch = jsonData["matches"];
    print(jsonDataMatch);

    for (int i = 0; i < jsonDataMatch.length; i++) {
      List<String> l = [];
      if (jsonDataMatch[i]["matchStarted"] &&
          !jsonDataMatch[i].containsKey("winner_team")) {
        l.add("${jsonDataMatch[i]["unique_id"]}");
        l.add("TBA");
        _matchIdList.insert(0, l);
      } else if (jsonDataMatch[i]["matchStarted"]) {
        l.add("${jsonDataMatch[i]["unique_id"]}");
        l.add("${jsonDataMatch[i]["winner_team"]}");
        _matchIdList.add(l);
      }
      if (i == 30) {
        break;
      }
    }

    getScore();
  }

  void getScore() async {
    for (int i = 0; i < _matchIdList.length; i++) {
      String url =
          "https://cricapi.com/api/cricketScore?apikey=EgZQBD8hhqPlR5AG1Yr20XpGmgB2&unique_id=${_matchIdList[i][0]}";
      final response = await http.get(Uri.parse(url));
      final jsonData = json.decode(response.body);
      // print(jsonData);
      List<String> score = jsonData.split("v");
      String team1;
      String score1;
      String team2;
      String score2;
      if (score[0].contains("*")) {
        for (int i = 0; i < score[0].length; i++) {
          // if(int.parse(score[0][i])> && )
        }
      }

      // print(jsonData);
      notifyListeners();
    }
  }
}
