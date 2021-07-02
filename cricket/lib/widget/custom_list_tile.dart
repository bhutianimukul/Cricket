import 'package:cricket/model/match_detail.dart';
import "package:flutter/material.dart";

class CustomListTile extends StatelessWidget {
  late MatchDetail obj;
  CustomListTile(this.obj);
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
                      radius: 30,
                    ),
                    // SizedBox(width: 10),
                    Text("V/S"),
                    // SizedBox(width: 10),
                    CircleAvatar(
                      radius: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "120/2*",
                      style: TextStyle(fontSize: 19),
                    ),
                    Text(
                      "-",
                      style: TextStyle(fontSize: 19),
                    ),
                    Text(
                      "200/9",
                      style: TextStyle(fontSize: 19),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child:
                      matchStarted ? Text("Winner TBA") : Text("Winner Team1"),
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
