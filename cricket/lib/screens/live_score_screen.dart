import 'package:cricket/model/match_detail.dart';
import 'package:cricket/widget/custom_list_tile.dart';
import "package:flutter/material.dart";

class LiveScoreScreen extends StatelessWidget {
  late List<MatchDetail> match;
  LiveScoreScreen(this.match);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //  first match score by time

          Container(
              // width: double.infinity,
              // height: MediaQuery.of(context).size.height * .24,
              // padding: EdgeInsets.all(10),
              // // decoration: BoxDecoration(borderRadius: BorderRadius.),
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text("Live Score"),
              //     CustomListTile(match[0]),
              //   ],
              // ),
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
              child: ListView.builder(
                itemCount: match.length,
                itemBuilder: (_, index) => CustomListTile(match[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
