import "package:flutter/material.dart";

class RankingWidget extends StatelessWidget {
  late List rankings;

  RankingWidget({required this.rankings});

  @override
  Widget build(BuildContext context) {
    return rankings.length == 0
        ? Center(
            child: Text("No Ranking Available"),
          )
        : Container(
            child: ListView.builder(
              itemCount: rankings.length,
              itemBuilder: (_, index) => ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(rankings[index].imageUrl),
                ),
                title: Text(rankings[index].name),
                trailing: Text("${rankings[index].position}"),
              ),
            ),
          );
  }
}
