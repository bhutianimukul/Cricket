import 'package:cricket/Provider/score_provider.dart';
import 'package:cricket/widget/upcoming_tile.dart';
import 'package:flutter/material.dart';
import 'package:cricket/model/match.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'loading_screen.dart';

class Upcoming extends StatefulWidget {
  static const routeName = "/up";
  const Upcoming({Key? key}) : super(key: key);

  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  List<Match> items = [];
  List<Widget> cards = [];
  bool isLoading = true;
  @override
  void initState() {
    final pro = Provider.of<ScoreProvider>(context, listen: false);
    getData(pro);

    super.initState();
  }

  void getData(pro) async {
    setState(() {
      isLoading = true;
    });
    await pro.upcomingMatches();
    items = pro.upMatchList;

    setState(() {
      isLoading = false;
    });
  }

  String team1 = "";
  String team2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Loading()
          : ListView.builder(
              itemBuilder: (_, index) {
                print(items[index].team1 +
                    items[index].team2 +
                    " " +
                    items[index].team1Flag);
                return UpcomingTile(items[index], items[index].team1Flag,
                    items[index].team2Flag);
              },
              itemCount: items.length),
    );
  }
}
