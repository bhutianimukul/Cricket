import 'package:cricket/model/match_detail.dart';
import "package:flutter/material.dart";

class CustomListTile extends StatelessWidget {
  final Map<String?, String> map = {
    "india":
        "https://qph.fs.quoracdn.net/main-qimg-e02c4087ee03602df50ad2a98b0fe261",
    "australia":
        "data:image/jpeg;base64,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",
    "england": "https://image.emojipng.com/790/4254790.jpg",
    "west":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_xJJnGwcbQIJ_Af5NXgZ9eq82lVExSM_GJg&usqp=CAU",
    "bangladesh":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC2c89oYzJ8_FQKNpQWoUgN9mdp-0Mpiqsow&usqp=CAU",
    "sri":
        "https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Sri_Lanka_Cricket_Cap_Insignia.svg/1200px-Sri_Lanka_Cricket_Cap_Insignia.svg.png",
    "pakistan":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJZMe-TZyCXbuOek0AWLugyDa45M6fJDT01g&usqp=CAU",
    "new":
        "https://upload.wikimedia.org/wikipedia/en/thumb/3/35/New_Zealand_Cricket_Cap_Insignia.svg/1200px-New_Zealand_Cricket_Cap_Insignia.svg.png",
    "zimbabwe":
        "https://www.logolynx.com/images/logolynx/9c/9cf03974986d6175eb473db8a070e180.jpeg",
    "south":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTl5kJCC0_Xx4fAxSQa0IDv6p0t-mNz-nuYk9BX6ydaLC7u1sZvXCnVL0eQdtXsLtR5K8&usqp=CAU"
  };
  final String defaultImageUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_dmLCyf1S3x-cb98j9cJrURFB_XitfL3hefPuCOofudQCnILKC9iHxhY8D5uMxcel9zI&usqp=CAU";
  late MatchDetail match;
  CustomListTile(this.match);
  bool matchStarted = false;
  @override
  Widget build(BuildContext context) {
    String? src1 = "";
    if (match.currentTeam == null)
      src1 = defaultImageUrl;
    else if (map.containsKey(match.currentTeam.toLowerCase())) {
      String? s = match.currentTeam.toLowerCase();
      src1 = map[s];
    } else
      src1 = defaultImageUrl;

    String? src2 = "";
    if (match.otherTeam == null)
      src2 = defaultImageUrl;
    else if (map.containsKey(match.otherTeam.toLowerCase())) {
      String? s = match.otherTeam.toLowerCase();
      src2 = map[s];
    } else
      src2 = defaultImageUrl;

    // print(match.otherTeamScore.split(" "));
    // print(match.currentTeam + " " + match.otherTeam);
    List<String> temp = match.currentTeamScore.split(" ");
    String curTeamScore = temp[temp.length - 2] + temp[temp.length - 1];
    String curTeamName = "";
    for (int i = 0; i < temp.length - 2; i++) curTeamName += temp[i];
    temp = match.otherTeamScore.split(" ");
    String othTeamScore =
        temp[temp.length - 1] == "" ? "-" : temp[temp.length - 1];

    String othTeamName = "";
    for (int i = 0; i < temp.length - 1; i++) othTeamName += temp[i];
    // print(othTeamName + " " + othTeamScore);

    //  print(curTeamName + " " + curTeamScore);

    return InkWell(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            // color: Colors.white,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 23,
                          backgroundImage: NetworkImage(src1.toString()),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          curTeamName,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          curTeamScore,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "VS",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 23,
                          backgroundImage: NetworkImage(src2.toString()),
                        ),
                        Text(
                          othTeamName,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          othTeamScore,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(match.winner),
              ],
            ),
          ),
          // SizedBox(
          //   height: 3,
          // )
        ],
      ),
    );
  }
}
