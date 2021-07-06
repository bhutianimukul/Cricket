import 'package:cricket/Provider/player_provider.dart';
import 'package:cricket/model/player.dart';
import 'package:cricket/screens/player_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerSearch extends StatefulWidget {
  static const routeName = "/playersearch";

  @override
  _PlayerSearchState createState() => _PlayerSearchState();
}

class _PlayerSearchState extends State<PlayerSearch> {
//  bool flag = false;

  TextEditingController text = TextEditingController();
  List<Pair> playerList = [];
  void search() async {
    // setState(() {
    //   playerList = [];
    // });
    if (text.text.length > 0) {
      final res = Provider.of<PlayerProvider>(context, listen: false);
      await res.fetchPlayerFromName(text.text);

      setState(() {
        //   flag = true;

        playerList = res.idList;
      });
      //   text.clear();
      print(playerList);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<Player> getPlayer(int id) async {
      return await Provider.of<PlayerProvider>(context, listen: false)
          .fetchById(id);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Search Player"),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .85,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a Player Name',
                      ),
                      controller: text,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      return search();
                    },
                    child: Icon(
                      Icons.search_sharp,
                      size: 25,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: playerList.length,
                itemBuilder: (_, index) => ListTile(
                  title: Text(playerList[index].name),
                  onLongPress: () async {
                    Player p = await getPlayer(playerList[index].id);
                    Navigator.pushNamed(
                      context,
                      PlayerDetailScreen.routeName,
                      arguments: p,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
