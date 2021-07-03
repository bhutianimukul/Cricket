import 'package:cricket/Provider/NewsProvider.dart';
import 'package:cricket/model/news.dart';
import 'package:cricket/widget/Global_news_tile.dart';
import 'package:cricket/widget/SwapCard.dart';
import "package:flutter/material.dart";
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<News> items = [];
  List<Widget> cards = [];
  bool isLoading = true;
  @override
  void initState() {
    final pro = Provider.of<NewsProvider>(context, listen: false);
    getData(pro);

    super.initState();
  }

  void getData(pro) async {
    setState(() {
      isLoading = true;
    });
    await pro.fetchNews();
    items = pro.newsList;
    for (int i = 0; i < items.length; i++) {
      cards.add(GlobalNewsTile(
        item: items[i],
      ));
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: SwapCard(
        cards: cards,
        title: 'Cricket News',
      ),
    );
  }
}
