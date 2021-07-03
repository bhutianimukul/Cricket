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
    // print(jsonDataMatch);

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

    await getScore();
  }

  Future<void> getScore() async {
    for (int i = 0; i < _matchIdList.length; i++) {
      String url =
          "https://cricapi.com/api/cricketScore?apikey=EgZQBD8hhqPlR5AG1Yr20XpGmgB2&unique_id=${_matchIdList[i][0]}";
      final response = await http.get(Uri.parse(url));
      final jsonData = json.decode(response.body);
      //  print(jsonData);
      if (jsonData["score"] == null) continue;
      List<String> score = jsonData["score"].split("v");
      //print(jsonData["score"]);
      //print(score);
      // "team 1 scre v tem2 cd"
      String team1 = "";
      String score1 = "";
      String team2 = "";
      String score2 = "";
      if (score[0].contains("*")) {
        // team1 130/4*
        score1 = score[0];
        List<String> temp = score1.split(" ");
        team1 = temp[0];
        score2 = score[1];
        List<String> temp1 = score2.split(" ");
        team2 = temp1[0];
      } else if (score[1].contains("*")) {
        score2 = score[0];
        List<String> temp = score2.split(" ");
        team2 = temp[0];
        score1 = score[1];
        List<String> temp1 = score1.split(" ");
        team1 = temp1[0];
      } else {
        score1 = score[0];
        List<String> temp = score1.split(" ");
        team1 = temp[0];
        score2 = score[1];
        List<String> temp1 = score2.split(" ");
        team2 = temp1[0];
      }

      // print(score1 + " " + score2);
      MatchDetail match = MatchDetail(
        currentTeamScore: score1,
        otherTeamScore: score2,
        currentTeam: team1,
        otherTeam: team2,
        winner: _matchIdList[i][1],
        matchId: _matchIdList[i][0],
      );
      _matchList.add(match);

      // print(jsonData);

    }

    print(_matchList);
    notifyListeners();
  }
}
