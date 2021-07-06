import 'package:cricket/widget/record_bowling.dart';
import 'package:cricket/widget/records_widget.dart';
import "package:flutter/material.dart";

class StatsWidget extends StatelessWidget {
  late Map<String, String> record;
  StatsWidget(this.record);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text("Batting"),
              ),
              Tab(
                child: Text("Bowling"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RecordWidget(record: record),
            RecordBowlingWidget(record: record),
          ],
        ),
      ),
    );
  }
}
