import 'package:cricket/model/news.dart';
import "package:flutter/material.dart";
import 'package:swipe_to/swipe_to.dart';

import 'package:url_launcher/url_launcher.dart' as launcher;

class NewsDetailScreen extends StatelessWidget {
  static const routeName = '/detail';
  @override
  Widget build(BuildContext context) {
    final News item = ModalRoute.of(context)!.settings.arguments as News;

    return SwipeTo(
      iconOnLeftSwipe: Icons.open_in_browser_rounded,
      iconColor: Colors.white,
      animationDuration: Duration(seconds: 1),
      onLeftSwipe: () async {
        if (await launcher.canLaunch(item.url))
          await launcher.launch(
            item.url,
            forceSafariVC: false,
            forceWebView: false,
            headers: <String, String>{'my_header_key': 'my_header_value'},
          );
      },
      onRightSwipe: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                item.title,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(
                  10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      item.description,
                      // textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_left_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    'Swipe',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_right_outlined,
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
