import 'package:cricket/model/player.dart';
import 'package:cricket/widget/profile_widget.dart';
import 'package:cricket/widget/records_widget.dart';
import "package:flutter/material.dart";

class PLayerTabWidget extends StatelessWidget {
  late Player player;
  PLayerTabWidget({required this.player});
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
                child: Text("Profile"),
              ),
              Tab(
                child: Text("Records"),
              ),
            ],
          ),
          title: Center(
            child: Text(player.personal["name"].toString()),
          ),
        ),
        body: TabBarView(
          children: [
            ProfileWidget(
              player: player.personal,
              majorTeams: player.majorTeams,
            ),
            RecordWidget(record: player.records),
          ],
        ),
      ),
    );
  }
}
