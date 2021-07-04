import 'package:cricket/screens/ranking_screen.dart';
import 'package:cricket/screens/ranking_screen_women.dart';
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
        tile("ICC Ranking Women", RankingWomenScreen.routeName),
        tile("Venue", RankingScreen.routeName),
        tile("Player Search", RankingScreen.routeName),
      ],
    );
  }
}
