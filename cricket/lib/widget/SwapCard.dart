import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

// ignore: must_be_immutable
class SwapCard extends StatefulWidget {
  final title;
  List<Widget> cards = [];
  SwapCard({
    this.title,
    required this.cards,
  });

  @override
  _SwapCardState createState() => _SwapCardState();
}

class _SwapCardState extends State<SwapCard> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    widget.title,
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
              child: widget.cards.length == 0
                  ? CircularProgressIndicator()
                  : TCard(
                      cards: widget.cards,
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
