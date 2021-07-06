import "package:flutter/material.dart";

class RecordBowlingWidget extends StatelessWidget {
  late Map<String, String> record;
  RecordBowlingWidget({required this.record});

  @override
  Widget build(BuildContext context) {
    TableRow tableRow(String p1, String p2, String p3, String p4) {
      return TableRow(
        decoration: const BoxDecoration(
          color: Colors.white54,
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
    return Container(
      color: Colors.green[100],
      child: Table(
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
          tableRow("Matches", record["testMat"].toString(),
              record["odiMat"].toString(), record["t20Mat"].toString()),
          tableRow("Wickets", record["testW"].toString(),
              record["odiW"].toString(), record["t20W"].toString()),
          tableRow("Avg", record["testAvg"].toString(),
              record["odiAvg"].toString(), record["t20Avg"].toString()),
          tableRow("Economy", record["testEcon"].toString(),
              record["odiEcon"].toString(), record["t20Econ"].toString()),
          tableRow("BBI", record["testBBI"].toString(),
              record["odiBBI"].toString(), record["t20BBI"].toString()),
          tableRow("5 W", record["test5w"].toString(),
              record["odi5w"].toString(), record["t205w"].toString()),
        ],
      ),
    );
  }
}
