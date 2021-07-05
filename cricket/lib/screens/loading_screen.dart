import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
          "https://media.giphy.com/media/HbwreR506SSwsIpPDO/giphy.gif"),
    );
  }
}
