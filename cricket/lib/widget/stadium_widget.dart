import 'package:cricket/model/venue.dart';
import 'package:flutter/material.dart';

class StadiumWidget extends StatelessWidget {
  late Venue stadium;
  StadiumWidget(this.stadium);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  stadium.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 250,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Text(
                    stadium.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(stadium.location),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.people_alt,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(stadium.capacity.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
