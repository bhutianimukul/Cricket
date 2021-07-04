import 'package:cricket/screens/ranking_screen.dart';
import "package:flutter/material.dart";

class MoreScreen extends StatelessWidget {
  static const rountName = "/more";

  @override
  Widget build(BuildContext context) {
    Widget tile(String title, String routeName) {
      return ListTile(
        title: Text(title),
        onTap: () => Navigator.pushNamed(context, routeName),
      );
    }

    return Column(
      children: [
        tile("ICC Ranking Men", RankingScreen.routeName),
        tile("ICC Ranking Women", RankingScreen.routeName),
        tile("Player Detail", RankingScreen.routeName),
        tile("Destination ", RankingScreen.routeName),
      ],
    );
  }
}
