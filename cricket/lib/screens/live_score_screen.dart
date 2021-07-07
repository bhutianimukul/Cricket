import 'package:cricket/model/match_detail.dart';
import 'package:cricket/widget/custom_list_tile.dart';
import "package:flutter/material.dart";

class LiveScoreScreen extends StatelessWidget {
  late List<MatchDetail> match;
  LiveScoreScreen(this.match);
  @override
  Widget build(BuildContext context) {
    MatchDetail live = match[0];
    // match.remove(live);
    return Container(
      color: Colors.grey[350],
      child: Column(
        children: [
          //  first match score by time

          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .22,
            padding: EdgeInsets.all(10),
            // decoration: BoxDecoration(borderRadius: BorderRadius.),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Live Match",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                CustomListTile(live),
              ],
            ),
          ),
          //
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 18, left: 18, right: 18),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              //color: Colors.green,
              child: Column(
                children: [
                  Text(
                    "Other Live Matches",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Container(
                      child: match.length == 1
                          ? Center(
                              child: Text(
                                "No Live Match Available",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: match.length - 1,
                              itemBuilder: (_, index) =>
                                  CustomListTile(match[index + 1]),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
