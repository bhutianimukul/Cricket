import "package:flutter/material.dart";

class RecordBowlingWidget extends StatelessWidget {
  late Map<String, String> record;
  RecordBowlingWidget({required this.record});

  @override
  Widget build(BuildContext context) {
    TableRow tableRow(String p1, String p2, String p3, String p4) {
      return TableRow(
        decoration: const BoxDecoration(
          color: Colors.grey,
        ),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(p1),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(p2),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(p3),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(p4),
            ),
          ),
        ],
      );
    }

    print(record);
    print(record["odiRuns"]);
    print(record["odiW"]);
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FixedColumnWidth(60),
        2: FixedColumnWidth(60),
        3: FixedColumnWidth(60),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(""),
              ),
            ),
            Container(
              width: 30,
              child: Center(
                child: Text("Test"),
              ),
            ),
            Container(
              child: Center(
                child: Text("ODI"),
              ),
            ),
            Container(
              child: Center(
                child: Text("T20"),
              ),
            ),
          ],
        ),
        tableRow("Matches", "Test", "Test", "Test"),
        tableRow("Wickets", "Test", "Test", "Test"),
        tableRow("Avg", "Test", "Test", "Test"),
        tableRow("Economy", "Test", "Test", "Test"),
        tableRow("Best", "Test", "Test", "Test"),
        tableRow("5 W", "Test", "Test", "Test"),
      ],
    );
  }
}
