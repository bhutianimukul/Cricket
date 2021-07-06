import "package:flutter/material.dart";

class RecordWidget extends StatelessWidget {
  late Map<String, String> record;
  RecordWidget({required this.record});

  @override
  Widget build(BuildContext context) {
    print(record);
    print(record["odiRun"]);
    print(record["odiW"]);
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FixedColumnWidth(100),
        2: IntrinsicColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text("Matches"),
              ),
            ),
            Container(
              width: 30,
              child: Center(
                child: Text("Scores"),
              ),
            ),
            Container(
              child: Center(
                child: Text("Wicket Taken"),
              ),
            ),
          ],
        ),
        TableRow(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          children: [
            Container(
              child: Center(
                child: Text("Odi"),
              ),
            ),
            Container(
              child: Center(
                child: Text(record["odiRun"].toString()),
              ),
            ),
            Container(
              child: Center(
                child: Text(record["odiW"].toString()),
              ),
            ),
          ],
        ),
        TableRow(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          children: [
            Container(
              child: Center(
                child: Text("Test"),
              ),
            ),
            Container(
              child: Center(
                child: Text(record["testRuns"].toString()),
              ),
            ),
            Container(
              child: Center(
                child: Text(record["testW"].toString()),
              ),
            ),
          ],
        ),
        TableRow(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          children: [
            Container(
              child: Center(
                child: Text("T20"),
              ),
            ),
            Container(
              child: Center(
                child: Text(record["t20Runs"].toString()),
              ),
            ),
            Container(
              child: Center(
                child: Text(record["t20RW"].toString()),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
