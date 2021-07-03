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
        // current team
        // for (int i = 0; i < score[0].length; i++) {
        //   List<String> temp = score[0].split(" ");
        //   //"team1"
        //   score1 = temp[temp.length - 2];
        //   int size = temp.length - 1;
        //   if (score1.split("/").length < 1) {
        //     score1 = "-";
        //     size++;
        //   }
        //   for (int i = 0; i < size; i++) {
        //     team1 += temp[i];
        //   }
        // }
        // // other team
        // for (int i = 0; i < score[1].length; i++) {
        //   List<String> temp = score[1].split(" ");
        //   score2 = temp[temp.length - 1];
        //   int size = temp.length - 1;
        //   if (score2.split("/").length < 1) {
        //     score1 = "-";
        //     size++;
        //   }
        //   for (int i = 0; i < size; i++) {
        //     team2 += temp[i];
        //   }
        // }

        score1 = score[0];
        score2 = score[1];
      } else {
        // other team
        // for (int i = 0; i < score[1].length; i++) {
        //   List<String> temp = score[1].split(" ");
        //   //"team1"
        //   score1 = temp[temp.length - 1];
        //   int size = temp.length - 1;
        //   if (score1.split("/").length < 1) {
        //     score1 = "-";
        //     size++;
        //   }
        //   for (int i = 0; i < size; i++) {
        //     team1 += temp[i];
        //   }
        // }

        // // current team
        // for (int i = 0; i < score[0].length; i++) {
        //   List<String> temp = score[0].split(" ");
        //   score2 = temp[temp.length - 1];
        //   int size = temp.length - 1;
        //   if (score2.split("/").length < 1) {
        //     score2 = "-";
        //     size++;
        //   }
        //   for (int i = 0; i < size; i++) {
        //     team2 += temp[i];
        //   }
        // }
        score2 = score[0];
        score1 = score[1];
      }

      print(score1 + " " + score2);
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
