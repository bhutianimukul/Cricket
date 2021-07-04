import 'package:cricket/Provider/rank_provider.dart';
import 'package:cricket/widget/ranking_widget.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class RankingScreen extends StatefulWidget {
  static const routeName = "/ranking";
  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  bool isLoading = false;
  late List odirank;
  late List t20rank;
  late List testrank;
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
        body: DefaultTabController(
          length: 3,
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  appBar: AppBar(
                    bottom: TabBar(
                      tabs: [
                        Tab(
                          child: Text("ODI"),
                        ),
                        Tab(
                          child: Text("T20"),
                        ),
                        Tab(
                          child: Text("Test"),
                        )
                      ],
                    ),
                    title: Center(child: Text("Rankings")),
                  ),
                  body: TabBarView(
                    children: [
                      RankingWidget(rankings: odirank),
                      RankingWidget(rankings: t20rank),
                      RankingWidget(rankings: testrank),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
