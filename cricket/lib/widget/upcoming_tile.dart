import 'package:cricket/Provider/score_provider.dart';
import 'package:cricket/model/match.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class UpcomingTile extends StatefulWidget {
  late Match m;
  late String team1;
  late String team2;
  UpcomingTile(this.m, this.team1, this.team2);

  @override
  _UpcomingTileState createState() => _UpcomingTileState();
}

class _UpcomingTileState extends State<UpcomingTile> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? CircularProgressIndicator()
        : Container(
            child: Column(
              children: [
                Image.network(widget.team1),
                Text("kkkkkkkk"),
                Image.network(widget.team2),
              ],
            ),
          );
  }
}
