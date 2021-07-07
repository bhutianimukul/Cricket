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
      personal["profile"] = "Nodata";
    if (jsonData.containsKey("imageURL") && jsonData["imageURL"] != null)
      personal["imageUrl"] = jsonData["imageURL"];
    else
      personal["imageUrl"] =
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjmefPkNFco4Av1uI7UTjwzGk44EAXl_QNEA&usqp=CAU";
    if (jsonData.containsKey("currentAge") && jsonData["currentAge"] != null)
      personal["age"] = jsonData["currentAge"];
    else
      personal["age"] = "No data  found ";

    if (jsonData.containsKey("born") && jsonData["born"] != null)
      personal["born"] = jsonData["born"];
    else
      personal["born"] = "No data found";

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
    // print(batting);
    if (batting == null) return record;
    if (batting.containsKey("T20Is"))
      record["t20Runs"] = batting["T20Is"]["Runs"];
    else
      record["t20Runs"] = "0";
    if (batting.containsKey("T20Is"))
      record["t20100"] = batting["T20Is"]["100"];
    else
      record["t20100"] = "0";
    if (batting.containsKey("T20Is"))
      record["t2050"] = batting["T20Is"]["50"];
    else
      record["t2050"] = "0";
    if (batting.containsKey("T20Is"))
      record["t20Mat"] = batting["T20Is"]["Mat"];
    else
      record["t20Mat"] = "0";
    if (batting.containsKey("T20Is"))
      record["t20Avg"] = batting["T20Is"]["Ave"];
    else
      record["t20Avg"] = "0";
    if (batting.containsKey("ODIs"))
      record["odiAvg"] = batting["ODIs"]["Ave"];
    else
      record["odiAvg"] = "0";
    if (batting.containsKey("ODIs"))
      record["odiHs"] = batting["ODIs"]["HS"];
    else
      record["odiHs"] = "0";
    if (batting.containsKey("ODIs"))
      record["odi50"] = batting["ODIs"]["50"];
    else
      record["odi50"] = "0";
    if (batting.containsKey("ODIs"))
      record["odi100"] = batting["ODIs"]["100"];
    else
      record["odi100"] = "0";
    if (batting.containsKey("T20Is"))
      record["t20Hs"] = batting["T20Is"]["HS"];
    else
      record["t20Hs"] = "0";
    if (batting.containsKey("ODIs"))
      record["odiRuns"] = batting["ODIs"]["Runs"];
    else
      record["odiRuns"] = "0";
    if (batting.containsKey("ODIs"))
      record["odiMat"] = batting["ODIs"]["Mat"];
    else
      record["odiMat"] = "0";
    if (batting.containsKey("tests"))
      record["testRuns"] = batting["tests"]["Runs"];
    else
      record["testRuns"] = "0";
    if (batting.containsKey("tests"))
      record["testAvg"] = batting["tests"]["Ave"];
    else
      record["testAvg"] = "0";
    if (batting.containsKey("tests"))
      record["testMat"] = batting["tests"]["Mat"];
    else
      record["testMat"] = "0";
    if (batting.containsKey("tests"))
      record["testHs"] = batting["tests"]["HS"];
    else
      record["testHs"] = "0";
    if (batting.containsKey("tests"))
      record["test50"] = batting["tests"]["50"];
    else
      record["test50"] = "0";

    if (batting.containsKey("tests"))
      record["test100"] = batting["tests"]["100"];
    else
      record["test100"] = "0";

    final bowling = jsonData["bowling"];
    if (bowling.containsKey("T20Is"))
      record["t20W"] = bowling["T20Is"]["Wkts"];
    else
      record["t20RW"] = "0";
    if (bowling.containsKey("T20Is"))
      record["t20BBI"] = bowling["T20Is"]["BBI"];
    else
      record["t20BBI"] = "0";
    if (bowling.containsKey("T20Is"))
      record["t20Econ"] = bowling["T20Is"]["Econ"];
    else
      record["t20Econ"] = "0";
    if (bowling.containsKey("T20Is"))
      record["t20AvgW"] = bowling["T20Is"]["Ave"];
    else
      record["t20AvgW"] = "0";
    if (bowling.containsKey("T20Is"))
      record["t205w"] = bowling["T20Is"]["5w"];
    else
      record["t205w"] = "0";
    if (bowling.containsKey("ODIs"))
      record["odiW"] = bowling["ODIs"]["Wkts"];
    else
      record["odiW"] = "0";
    if (bowling.containsKey("tests"))
      record["testW"] = bowling["tests"]["Wkts"];
    else
      record["testW"] = "0";
    if (bowling.containsKey("tests"))
      record["testBBI"] = bowling["tests"]["BBI"];
    else
      record["testBBI"] = "0";
    if (bowling.containsKey("tests"))
      record["testAvgW"] = bowling["tests"]["Ave"];
    else
      record["testAvgW"] = "0";
    if (bowling.containsKey("tests"))
      record["test5w"] = bowling["tests"]["5w"];
    else
      record["test5w"] = "0";

    if (bowling.containsKey("tests"))
      record["testEcon"] = bowling["tests"]["Econ"];
    else
      record["testEcon"] = "0";
    if (bowling.containsKey("ODIs"))
      record["odiAvgW"] = bowling["ODIs"]["Ave"];
    else
      record["odiAvgW"] = "0";
    if (bowling.containsKey("ODIs"))
      record["odiEcon"] = bowling["ODIs"]["Econ"];
    else
      record["odiEcon"] = "0";
    if (bowling.containsKey("ODIs"))
      record["odiBBI"] = bowling["ODIs"]["BBI"];
    else
      record["odiBBI"] = "0";
    if (bowling.containsKey("ODIs"))
      record["odi5w"] = bowling["ODIs"]["5w"];
    else
      record["odi5w"] = "0";
    return record;
  }

// search player by id
  Future<Player> fetchById(int id) async {
    final response = await http.get(Uri.parse(
        "https://cricapi.com/api/playerStats?pid=$id&apikey=EgZQBD8hhqPlR5AG1Yr20XpGmgB2"));
    final jsonData = json.decode(response.body);

    List<String> majorTeams = jsonData["majorTeams"].split(",");
    if (majorTeams.length == 0) majorTeams = ["NoData"];

    Player p = Player(
        personal: personalData(jsonData),
        majorTeams: majorTeams,
        records: recordData(jsonData));
    notifyListeners();
    return p;
  }
}
