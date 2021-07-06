import "package:flutter/material.dart";

class ProfileWidget extends StatelessWidget {
  late Map<String, String> player;
  late List<String> majorTeams;
  ProfileWidget({required this.player, required this.majorTeams});

  @override
  Widget build(BuildContext context) {
    String team = "";
    for (String s in majorTeams) {
      team += s + ",";
    }
    team += ".";
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * .37,
                backgroundImage: NetworkImage(player["imageUrl"].toString()),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                player["name"].toString(),
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Text(
              "DOB: " + player["born"].toString(),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Age : " + player["age"].toString().substring(0, 8) + ".",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Country : " + player["country"].toString(),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Role : " + player["playingRole"].toString(),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Team Played With : ",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "\t" + team,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Desctription",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              player["profile"].toString(),
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
