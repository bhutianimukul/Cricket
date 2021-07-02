import 'package:cricket/screens/live_score_screen.dart';
import 'package:cricket/screens/news_screen.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import "package:flutter/material.dart";

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 1;
  void changePage(index) {
    setState(() {
      currentIndex = index;
    });
    // print(index);
  }

  final List<Widget> screens = [
    LiveScoreScreen(),
    NewsScreen(),
    Center(
      child: Text("More"),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: screens[currentIndex], //screens[currentIndex],
      bottomNavigationBar: FancyBottomNavigation(
        //  circleColor: Colors.green,
        // activeIconColor: Colors.greenAccent,
        tabs: [
          TabData(
            title: "Live",
            iconData: Icons.home,
          ),
          TabData(
            iconData: Icons.search,
            title: "News",
          ),
          TabData(
            iconData: Icons.shopping_cart,
            title: "More",
          )
        ],
        onTabChangedListener: changePage,
      ),
    );
  }
}
