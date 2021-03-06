import 'package:cricket/Provider/score_provider.dart';

import 'package:cricket/screens/main_screen.dart';

import 'package:cricket/screens/news_detail_screen.dart';
import 'package:cricket/screens/player_detail_screen.dart';
import 'package:cricket/screens/player_search_screen.dart';
import 'package:cricket/screens/ranking_screen.dart';
import 'package:cricket/screens/ranking_screen_women.dart';
import 'package:cricket/screens/stadiums_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/NewsProvider.dart';
import 'Provider/player_provider.dart';
import 'Provider/rank_provider.dart';
import 'Provider/venue_provider.dart';
import 'screens/upcoming_matches_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScoreProvider>(
            create: (BuildContext context) => ScoreProvider()),
        ChangeNotifierProvider<NewsProvider>(
            create: (BuildContext context) => NewsProvider()),
        ChangeNotifierProvider<RankProvider>(
            create: (BuildContext context) => RankProvider()),
        ChangeNotifierProvider<VenueProvider>(
            create: (BuildContext context) => VenueProvider()),
        ChangeNotifierProvider<PlayerProvider>(
            create: (BuildContext context) => PlayerProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
        routes: {
          NewsDetailScreen.routeName: (_) => NewsDetailScreen(),
          RankingScreen.routeName: (_) => RankingScreen(),
          RankingWomenScreen.routeName: (_) => RankingWomenScreen(),
          StadiumScreen.routeName: (_) => StadiumScreen(),
          Upcoming.routeName: (_) => Upcoming(),
          PlayerSearch.routeName: (_) => PlayerSearch(),
          PlayerDetailScreen.routeName: (_) => PlayerDetailScreen(),
        },
        theme: ThemeData(
            // Define the default brightness and colors.
            brightness: Brightness.dark,
            primaryColor: Color(0xff053742),
            accentColor: Color(0xff39A2DB),
            canvasColor: Color(0xffA2DBFA),
            // highlightColor: Color(0xffE8F0F2),

            // Define the default font family.
            fontFamily: 'Georgia'),
      ),
    );
  }
}
