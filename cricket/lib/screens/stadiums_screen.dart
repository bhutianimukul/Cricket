import 'package:cricket/Provider/venue_provider.dart';
import 'package:cricket/model/venue.dart';
import 'package:cricket/widget/stadium_widget.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class StadiumScreen extends StatefulWidget {
  static const routeName = "/stadium";

  @override
  _StadiumScreenState createState() => _StadiumScreenState();
}

class _StadiumScreenState extends State<StadiumScreen> {
  bool isLoading = false;
  List<Venue> stadium = [];

  @override
  void initState() {
    final res = Provider.of<VenueProvider>(context, listen: false);
    getData(res);
    super.initState();
  }

  void getData(res) async {
    setState(() {
      isLoading = true;
    });
    await res.fetchVenue();
    stadium = res.venueList;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(stadium);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stadiums"),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: stadium.length,
                itemBuilder: (BuildContext ctx, index) {
                  return StadiumWidget(stadium[index]);
                }),
      ),
    );
  }
}
