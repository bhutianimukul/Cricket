import 'package:cricket/Provider/score_provider.dart';
import 'package:cricket/model/match_detail.dart';
import 'package:cricket/screens/live_score_screen.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class CircularProgress extends StatefulWidget {
  const CircularProgress({Key? key}) : super(key: key);

  @override
  _CircularProgressState createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> {
  bool isLoaded = false;
  List<MatchDetail> match = [];
  @override
  void initState() {
    final pro = Provider.of<ScoreProvider>(context, listen: false);
//    match = Provider.of<ScoreProvider>(context, listen: false).matchList;
    getData(pro);
    super.initState();
  }

  void getData(pro) async {
    setState(() {
      isLoaded = false;
    });

    await pro.fetchData();
    match = pro.matchList;
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded == false
        ? Center(child: CircularProgressIndicator())
        : LiveScoreScreen(match);
  }
}
