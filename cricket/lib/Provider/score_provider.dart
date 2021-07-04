import 'package:cricket/model/match.dart';
import 'package:cricket/model/match_detail.dart';
import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import "dart:convert";

class ScoreProvider with ChangeNotifier {
  List<MatchDetail> _matchList = [];
  List<Match> _upMatchList = [];
  List<List<String>> _matchIdList = [];

  List<MatchDetail> get matchList {
    return [..._matchList];
  }

  List<Match> get upMatchList {
    return [..._upMatchList];
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
        // team1 123/3* v team2 1234/5

        score1 = score[0];
        score2 = score[1];
        //print(score2);
        team1 = score[0].split(" ")[0];
        team2 = score[1].split(" ")[1];
        //      print(score1.split(" "));
      } else if (score[1].contains("*")) {
        score1 = score[1];
        score2 = score[0];
        team1 = score[1].split(" ")[1];
        team2 = score[0].split(" ")[0];
        //    print(score1.split(" "));
      } else {
        score1 = score[0];
        score2 = score[1];
        team1 = score[0].split(" ")[0];
        team2 = score[1].split(" ")[1];
        //  print(score1.split(" "));
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

    //  print(_matchList);
    notifyListeners();
  }

  Future<void> upcomingMatches() async {
    String url =
        "https://cricapi.com/api/matches/?apikey=EgZQBD8hhqPlR5AG1Yr20XpGmgB2";
    final response = await http.get(Uri.parse(url));
    final jsonData = json.decode(response.body);

    List jsonDataMatch = jsonData["matches"];
    for (int i = 0; i < jsonDataMatch.length; i++) {
      if (jsonDataMatch[i]["matchStarted"] == false) {
        String team1 = jsonDataMatch[i]["team-1"].toLowerCase();
        String team2 = jsonDataMatch[i]["team-2"].toLowerCase();

        if (team1 == "india" ||
            team1 == "pakistan" ||
            team1 == "england" ||
            team1 == "australia" ||
            team1 == "south africa" ||
            team1 == "bangladesh" ||
            team1 == "new zealand" ||
            team1 == "sri lanka" ||
            team1 == "zimbabwe") {
          if (team2 == "india" ||
              team2 == "pakistan" ||
              team2 == "england" ||
              team2 == "australia" ||
              team2 == "bangladesh" ||
              team2 == "new zealand" ||
              team2 == "south africa" ||
              team2 == "sri lanka" ||
              team2 == "zimbabwe") {
            String team1Flag = getFlag(team1);
            String team2Flag = getFlag(team2);

            Match m = Match(
                team1Flag: team1Flag,
                team2Flag: team2Flag,
                team1: team1,
                team2: team2,
                date: jsonDataMatch[i]["date"],
                winner: "-",
                type: jsonDataMatch[i]["type"]);
            _upMatchList.add(m);
          }
        }
      }
    }
    notifyListeners();
  }

  String getFlag(name) {
    if (name == "england")
      return "https://www.worldometers.info/img/flags/uk-flag.gif";
    if (name == "sri lanka")
      return "https://www.worldometers.info/img/flags/ce-flag.gif";
    if (name == "australia")
      return "https://www.worldometers.info/img/flags/as-flag.gif";
    if (name == "india")
      return "https://www.worldometers.info/img/flags/in-flag.gif";
    if (name == "pakistan")
      return "https://www.worldometers.info/img/flags/pk-flag.gif";
    if (name == "south africa")
      return "https://www.worldometers.info/img/flags/sf-flag.gif";
    if (name == "bangladesh")
      return "https://www.worldometers.info/img/flags/bg-flag.gif";
    if (name == "zimbabwe")
      return "https://www.worldometers.info/img/flags/zi-flag.gif";
    if (name == "new zealand")
      return "https://www.worldometers.info/img/flags/nz-flag.gif";
    return "https://images.unsplash.com/photo-1599982917650-21da4d09c437?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNyaWNrZXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
  }
}
