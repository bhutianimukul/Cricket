import 'package:cricket/model/venue.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:convert";

class VenueProvider with ChangeNotifier {
  List<Venue> _venueList = [];
  List<Venue> get venueList {
    return [..._venueList];
  }

  Future<void> fetchVenue() async {
    String url =
        "https://cricket.sportmonks.com/api/v2.0/venues?api_token=NUlW0GSBmh9JUDIxSN0zvaUWY3cm5PNqHE6z0fL3f2CPifyrvs3PWg3v2SZ6";
    final response = await http.get(Uri.parse(url));
    final jsonData = json.decode(response.body);
    final result = jsonData["data"] as List;
    for (int i = 0; i < result.length; i++) {
      Venue v = new Venue(
          capacity: result[i]["capacity"] == null
              ? "-"
              : result[i]["capacity"].toString(),
          name: result[i]["name"],
          location: result[i]["city"],
          imageUrl: result[i]["image_path"]);
      _venueList.add(v);
    }
    notifyListeners();
  }
}
