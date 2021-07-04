import 'package:cricket/Provider/rank_provider.dart';
import 'package:cricket/widget/ranking_widget.dart';
import 'package:cricket/widget/tab_widget.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class RankingScreen extends StatefulWidget {
  static const routeName = "/ranking";
  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  bool isLoading = false;
  List odirank = [];
  List t20rank = [];
  List testrank = [];

  @override
  void initState() {
    final res = Provider.of<RankProvider>(context, listen: false);
    getData(res);
    super.initState();
  }

  void getData(res) async {
    setState(() {
      isLoading = true;
    });
    await res.fetchRanking();
    testrank = res.testList;
    t20rank = res.t20List;
    odirank = res.odiList;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TabWidget(
          isLoading: isLoading,
          odirank: odirank,
          t20rank: t20rank,
          testrank: testrank,
          title: "ICC Men Ranking",
        ),
      ),
    );
  }
}
