import 'package:cricket/model/match_detail.dart';
import "package:flutter/material.dart";

class CustomListTile extends StatelessWidget {
  late MatchDetail match;
  CustomListTile(this.match);
  bool matchStarted = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {},
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            // color: Colors.white,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 20,
                    ),
                    // SizedBox(width: 10),
                    Text("V/S"),
                    // SizedBox(width: 10),
                    CircleAvatar(
                      radius: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(match.currentTeamScore,
                          style: TextStyle(fontSize: 15),
                          softWrap: false,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      "-",
                      style: TextStyle(fontSize: 19),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        match.otherTeamScore,
                        style: TextStyle(fontSize: 15),
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(match.winner),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
