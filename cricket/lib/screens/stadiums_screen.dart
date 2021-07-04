import 'package:cricket/widget/stadium_widget.dart';
import "package:flutter/material.dart";

class StadiumScreen extends StatefulWidget {
  static const routeName = "/stadium";

  @override
  _StadiumScreenState createState() => _StadiumScreenState();
}

class _StadiumScreenState extends State<StadiumScreen> {
  List stadium = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.builder(
          //   itemCount: ,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 3 / 2,
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 20,
            mainAxisExtent: 20,
          ),
          itemBuilder: (_, index) => StadiumWidget(),
        ),
      ),
    );
  }
}
