import 'package:cricket/widget/ranking_widget.dart';
import "package:flutter/material.dart";

class TabWidget extends StatelessWidget {
  bool isLoading = false;
  List odirank = [];
  List t20rank = [];
  List testrank = [];

  TabWidget({
    required this.isLoading,
    required this.odirank,
    required this.t20rank,
    required this.testrank,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
    );
  }
}
