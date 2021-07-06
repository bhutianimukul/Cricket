import 'package:cricket/model/player.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import "dart:convert";

class Pair {
  int id;
  String name;
  Pair({required this.id, required this.name});
}

class PlayerProvider with ChangeNotifier {
  List<Pair> _idList = [];
  List<Pair> get idList {
    return [..._idList];
  }

// get player data
  Future<void> fetchPlayerFromName(String name) async {
    final response = await http.get(Uri.parse(
        "https://cricapi.com/api/playerFinder?name=$name&apikey=EgZQBD8hhqPlR5AG1Yr20XpGmgB2"));
    final jsonData = json.decode(response.body);
    final l = jsonData['data'];
    _idList.clear();

    for (int i = 0; i < l.length; i++) {
      if (l[i]['pid'] != 0) {
        _idList.add(Pair(id: l[i]['pid'], name: l[i]['fullName']));
      }
    }
    notifyListeners();
  }

  Map<String, String> personalData(jsonData) {
    Map<String, String> personal = {};
    if (jsonData.containsKey("profile") && jsonData["profile"] != null)
      personal["profile"] = jsonData["profile"];
    else
      personal["profile"] = "";
    if (jsonData.containsKey("imageURL"))
      personal["imageUrl"] = jsonData["imageURL"];
    else
      personal["imageUrl"] = "";
    if (jsonData.containsKey("currentAge") && jsonData["currentAge"] != null)
      personal["age"] = jsonData["currentAge"];
    else
      personal["age"] = "";

    if (jsonData.containsKey("born") && jsonData["born"] != null)
      personal["born"] = jsonData["born"];
    else
      personal["born"] = "";

    personal["name"] = jsonData["fullName"];

    if (jsonData.containsKey("country") && jsonData["country"] != null)
      personal["country"] = jsonData["country"];
    else
      personal["country"] = "";
    if (jsonData.containsKey("playingRole") && jsonData["playingRole"] != null)
      personal["playingRole"] = jsonData["playingRole"];
    else
      personal["playingRole"] = "";
    return personal;
  }

  Map<String, String> recordData(data) {
    final jsonData = data["data"];
    final batting = jsonData["batting"];
    Map<String, String> record = {};
    print(batting);
    //if (batting == null) return record;
    if (batting.containsKey("T20Is"))
      record["t20Runs"] = batting["T20Is"]["Runs"];
    else
      record["t20Runs"] = "0";
    if (batting.containsKey("ODIs"))
      record["odiRuns"] = batting["ODIs"]["Runs"];
    else
      record["odiRuns"] = "0";
    if (batting.containsKey("tests"))
      record["testRuns"] = batting["tests"]["Runs"];
    else
      record["testRuns"] = "0";
    final bowling = jsonData["bowling"];
    if (bowling.containsKey("T20Is"))
      record["t20W"] = bowling["T20Is"]["Wkts"];
    else
      record["t20RW"] = "0";
    if (bowling.containsKey("ODIs"))
      record["odiW"] = bowling["ODIs"]["Wkts"];
    else
      record["odiW"] = "0";
    if (bowling.containsKey("tests"))
      record["testW"] = bowling["tests"]["Wkts"];
    else
      record["testW"] = "0";

    return record;
  }

// search player by id
  Future<Player> fetchById(int id) async {
    final response = await http.get(Uri.parse(
        "https://cricapi.com/api/playerStats?pid=$id&apikey=EgZQBD8hhqPlR5AG1Yr20XpGmgB2"));
    final jsonData = json.decode(response.body);

    List<String> majorTeams = jsonData["majorTeams"].split(",");

    Player p = Player(
        personal: personalData(jsonData),
        majorTeams: majorTeams,
        records: recordData(jsonData));
    notifyListeners();
    return p;
  }
}
