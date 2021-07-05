import 'package:cricket/Provider/score_provider.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
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
    for (int i = 0; i < items.length; i++) {
      cards.add(UpcomingTile(
          m: items[i], team1: items[i].team1Flag, team2: items[i].team2Flag));
    }
    setState(() {
      isLoading = false;
    });
  }

  String team1 = "";
  String team2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upcoming Matches"),
      ),
      body: isLoading
          ? Loading()
          : Builder(
              builder: (context) => LiquidSwipe(
                initialPage: 0,
                enableLoop: true,
                positionSlideIcon: .95,
                slideIconWidget: Container(
                  height: 69,
                  child: Image.network(
                      "https://media.giphy.com/media/Up7Jqi6HeCzHKfBPYJ/giphy.gif"),
                ),
                pages: cards,
              ),
            ),
    );
  }
}
