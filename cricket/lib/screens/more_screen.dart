import 'package:cricket/screens/player_search_screen.dart';
import 'package:cricket/screens/ranking_screen.dart';
import 'package:cricket/screens/ranking_screen_women.dart';
import 'package:cricket/screens/stadiums_screen.dart';
import "package:flutter/material.dart";

import 'upcoming_matches_screen.dart';

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
        tile("Upcoming Fixtures", Upcoming.routeName),
        tile("ICC Ranking Men", RankingScreen.routeName),
        tile("ICC Ranking Women", RankingWomenScreen.routeName),
        tile("Venue", StadiumScreen.routeName),
        tile("Player Search", PlayerSearch.routeName),
      ],
    );
  }
}
