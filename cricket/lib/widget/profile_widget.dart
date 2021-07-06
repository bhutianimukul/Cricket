import "package:flutter/material.dart";
import 'package:http/http.dart';

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
    TableRow getRow(String s1, String s2) {
      return TableRow(children: [
        Text(
          s1,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          s2,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ]);
    }

    return Container(
      color: Colors.grey[400],
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Player Information",
              style: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Table(
              border: TableBorder(
                  horizontalInside: BorderSide(
                      width: 1, color: Colors.blue, style: BorderStyle.solid)),
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(100),
                1: IntrinsicColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                getRow(
                  "DOB:",
                  player["born"].toString(),
                ),
                getRow(
                  "Age:",
                  player["age"].toString().substring(0, 8) + ".",
                ),
                getRow(
                  "Country:",
                  player["country"].toString(),
                ),
                getRow(
                  "Role:",
                  player["playingRole"].toString(),
                ),
                getRow(
                  "Teams :",
                  team,
                ),
                getRow("", ""),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Desctription",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                player["profile"].toString(),
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
