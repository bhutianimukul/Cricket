import 'package:cricket/screens/circular_progress_screen.dart';
import 'package:cricket/screens/more_screen.dart';

import 'package:cricket/screens/news_screen.dart';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import "package:flutter/material.dart";

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  void changePage(index) {
    setState(() {
      currentIndex = index;
    });
    // print(index);
  }

  final List<Widget> screens = [
    NewsScreen(),
    CircularProgress(),
    MoreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Circket App",
            style: TextStyle(
              fontSize: 25,
              // fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
          ),
        ),
      ),
      body: screens[currentIndex], //screens[currentIndex],
      bottomNavigationBar: FancyBottomNavigation(
        //  circleColor: Colors.green,
        // activeIconColor: Colors.greenAccent,
        tabs: [
          TabData(
            iconData: Icons.article_rounded,
            title: "News",
          ),
          TabData(
            title: "Live",
            iconData: Icons.live_tv_rounded,
          ),
          TabData(
            iconData: Icons.more_vert_rounded,
            title: "More",
          )
        ],
        onTabChangedListener: changePage,
      ),
    );
  }
}
