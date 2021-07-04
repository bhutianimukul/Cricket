import 'package:flutter/material.dart';

class StadiumWidget extends StatelessWidget {
  const StadiumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                "https://qph.fs.quoracdn.net/main-qimg-e02c4087ee03602df50ad2a98b0fe261",
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("India"),
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
                      Text("capacity"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.black54,
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20,
              ),
              child: Text(
                "Location",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
