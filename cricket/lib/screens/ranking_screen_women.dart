import 'package:cricket/Provider/rank_provider.dart';

import 'package:cricket/widget/tab_widget.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class RankingWomenScreen extends StatefulWidget {
  static const routeName = "/rankingwomen";
  @override
  _RankingWomenScreenState createState() => _RankingWomenScreenState();
}

class _RankingWomenScreenState extends State<RankingWomenScreen> {
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
    await res.fetchRankingW();
    testrank = res.testListW;
    t20rank = res.t20ListW;
    odirank = res.odiListW;
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
          title: "ICC Women Ranking",
        ),
      ),
    );
  }
}
