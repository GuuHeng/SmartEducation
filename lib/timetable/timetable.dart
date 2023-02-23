import 'package:flutter/material.dart';
import 'timetable_settings.dart';
import 'weekday_timetable.dart';

class TimeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _TimeTable();
  }
}

class _TimeTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TimeTableState();
  }
}

class _TimeTableState extends State<_TimeTable> {
  var _title = "今日课表";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //     onPressed: () {
          //       openSetting();
          //     },
          //     icon: Icon(Icons.menu)),
          title: Text(_title),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  switchTimeTable(context);
                },
                icon: Icon(Icons.switch_camera))
          ],
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Column(
                children: [
                  Text("8:00"),
                  Text("9:00"),
                  Text("10:00"),
                  Text("11:00"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Table(
                children: <TableRow>[
                  TableRow(children: [Text("语文"), Text("数学")])
                ],
              ),
            )
          ],
        ),
        drawer: TimeTableSettings(),
      ),
    );
  }

  void switchTimeTable(BuildContext context) {
    setState(() {
      _title = _title == "这周课表" ? "今日课表" : "这周课表";
    });
  }

  void openSetting() {
    Scaffold.of(context).openDrawer();
  }
}
