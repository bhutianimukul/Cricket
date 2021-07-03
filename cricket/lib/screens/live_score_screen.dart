import 'package:cricket/Provider/score_provider.dart';
import 'package:cricket/model/match_detail.dart';
import 'package:cricket/widget/custom_list_tile.dart';
import "package:flutter/material.dart";
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class LiveScoreScreen extends StatefulWidget {
  @override
  _LiveScoreScreenState createState() => _LiveScoreScreenState();
}

class _LiveScoreScreenState extends State<LiveScoreScreen> {
  bool isLoaded = false;
  List<MatchDetail> match = [];

  @override
  void initState() {
    final pro = Provider.of<ScoreProvider>(context, listen: false);
//    match = Provider.of<ScoreProvider>(context, listen: false).matchList;
    getData(pro);
    super.initState();
  }

  void getData(pro) async {
    setState(() {
      isLoaded = false;
    });
    await pro.fetchData();
    match = pro.matchList;
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: !isLoaded,
      child: Container(
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
      ),
    );
  }
}
