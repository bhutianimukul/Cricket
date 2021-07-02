import 'package:cricket/Provider/score_provider.dart';
import 'package:cricket/model/match_detail.dart';
import 'package:cricket/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScoreProvider>(
      create: (BuildContext context) => ScoreProvider(),
      child: MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
