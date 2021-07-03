import 'package:cricket/Provider/score_provider.dart';
import 'package:cricket/screens/main_screen.dart';
import 'package:cricket/screens/news_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/NewsProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScoreProvider>(
            create: (BuildContext context) => ScoreProvider()),
        ChangeNotifierProvider<NewsProvider>(
            create: (BuildContext context) => NewsProvider())
      ],
      child: MaterialApp(
        home: MainScreen(),
        routes: {NewsDetailScreen.routeName:(_)=>NewsDetailScreen()},
      ),
    );
  }
}
