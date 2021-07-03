import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

import '../model/news.dart';
import 'Global_news_tile.dart';

class SwapCard extends StatelessWidget {
  final title;
  SwapCard({
    this.title,
    required this.items,
  });

  List<News> items = [];

  List<Widget> cards = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < items.length; i++) {
      cards.add(GlobalNewsTile(
        item: items[i],
      ));
    }
    print(cards);
    print(items);
    TCardController _controller = TCardController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green.shade200,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFFFBD56),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              // child: TinderSwapCard(
              //   orientation: AmassOrientation.RIGHT,
              //   stackNum: 4,
              //   maxWidth: MediaQuery.of(context).size.width,
              //   maxHeight: MediaQuery.of(context).size.height * .8,
              //   minHeight: MediaQuery.of(context).size.height * .5,
              //   minWidth: MediaQuery.of(context).size.width * 0.5,
              //   cardBuilder: (BuildContext context, int index) =>
              //       GlobalNewsTile(
              //     item: items[index],
              //   ),
              //   totalNum: items.length,
              // ),
              child: TCard(
                cards: cards,
                size: Size(400, 600),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_left_outlined),
                  Text(
                    'Swipe',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.arrow_right_outlined)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
