import "package:flutter/material.dart";

class RecordWidget extends StatelessWidget {
  late Map<String, String> record;
  RecordWidget({required this.record});

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
          tableRow("Runs", record["testRuns"].toString(),
              record["odiRuns"].toString(), record["t20Runs"].toString()),
          tableRow("Avg", record["testAvg"].toString(),
              record["odiAvg"].toString(), record["t20Avg"].toString()),
          tableRow("50's", record["test50"].toString(),
              record["odi50"].toString(), record["t2050"].toString()),
          tableRow("100's", record["test100"].toString(),
              record["odi100"].toString(), record["t20100"].toString()),
          tableRow("Highest Score", record["testHs"].toString(),
              record["odiHs"].toString(), record["t20Hs"].toString()),
        ],
      ),
    );
  }
}
