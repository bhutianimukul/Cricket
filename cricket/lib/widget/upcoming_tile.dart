import 'dart:math';

import 'package:cricket/model/match.dart';
import 'package:cricket/screens/loading_screen.dart';
import 'package:flutter/material.dart';

class UpcomingTile extends StatefulWidget {
  late Match m;
  late String team1;
  late String team2;
  UpcomingTile({
    required this.m,
    required this.team1,
    required this.team2,
  });

  @override
  _UpcomingTileState createState() => _UpcomingTileState();
}

class _UpcomingTileState extends State<UpcomingTile> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    List color = [
      Color.fromRGBO(255, 202, 40, 1),
      Color.fromRGBO(38, 166, 154, 1),
      Color.fromRGBO(156, 204, 101, 1),
      Color.fromRGBO(92, 107, 192, 1),
      Color.fromRGBO(121, 85, 72, 1),
      Color.fromRGBO(179, 136, 255, 1),
      Color.fromRGBO(255, 82, 82, 1),
    ];
    Color getColor() {
      final random = new Random();
      var i = random.nextInt(color.length);
      return color[i];
    }

    return isLoading == true
        ? Loading()
        : Card(
            elevation: 5,
            color: getColor(),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Column(
                children: [
                  Text(
                    "${widget.m.team1.toUpperCase()}",
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      // backgroundColor: Colors.cyan,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    //height: MediaQuery.of(context).size.height * .3,
                    width: MediaQuery.of(context).size.width * .7,
                    child: Image.network(
                      widget.team1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${widget.m.team2.toUpperCase()}",
                    style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //height: MediaQuery.of(context).size.height * .4,
                    width: MediaQuery.of(context).size.width * .7,
                    child: Image.network(widget.team2),
                  ),
                  Text(
                    "Date: ${widget.m.date.substring(0, 10)}",
                    style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${widget.m.type} Match",
                    style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
