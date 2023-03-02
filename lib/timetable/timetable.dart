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
          title: Text("今日课表"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  switchTimeTable(context);
                },
                icon: Text("周")),
          ],
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return _setupListRow();
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 1, color: Colors.black12);
          },
          itemCount: 10),
        drawer: TimeTableSettings(),
      ),
    );
  }

  Widget _setupListRow() {
    return Container(
      height: 120,
        child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Container(
            width: 50,
            child: Center(child: Text("08:00~08:45")),
          ),
        ),
        Expanded(
          child: Stack(
          children: [
            Center(
              child: Text(
                "语     文",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.grey),
              ),
            ),
            Column(
              textDirection: TextDirection.ltr,
              children: [
                Positioned(
                  top: 10,
                  left: 10,                  
                  child: DecoratedBox(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.blue),
                    child: IntrinsicWidth(
                      child: Row(
                  children: [
                    Text("@张老师：", style: TextStyle(fontSize: 12, color: Colors.red),),
                    Text("张三同学已请假", style: TextStyle(fontSize: 12, color: Colors.black),)
                  ]),
                    )
                  )
                  ),
                Positioned(
                  top: 10,
                  left: 10,                  child: Row(
                  children: [
                    Text("@张老师：", style: TextStyle(fontSize: 12, color: Colors.red),),
                    Text("张三同学已请假", style: TextStyle(fontSize: 12, color: Colors.black),)
                  ])),
              ],
            )
          ],
        ))
      ],
    ));
  }

  void switchTimeTable(BuildContext context) {
    setState(() {
      Navigator.pushNamed(context, "weekday_timetable");
    });
  }

  void openSetting() {
    Scaffold.of(context).openDrawer();
  }
}
