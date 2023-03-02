import 'package:flutter/material.dart';
import 'timetable_settings.dart';
import 'weekday_timetable.dart';
import 'package:smart_education/timetable/data/timetable_data_manager.dart';

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


  TimeTableDataManager _dataManager = TimeTableDataManager.dataManager;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _dataManager.get_today_timetable_data();

  }

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
              return _setupListRow(index);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(height: 1, color: Colors.black12);
            },
            itemCount: 10),
        drawer: TimeTableSettings(),
      ),
    );
  }

  final double timeAreaWidth = 50;
  Widget _setupListRow(int index) {
    return Container(
        height: 120,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                color: Color.fromARGB(7, 0, 0, 0),
                width: timeAreaWidth,
                child: Center(child: Text(_dataManager.currentDayLessonTimeList[index].beginTime + "~" + _dataManager.currentDayLessonTimeList[index].endTime)),
              ),
            ),
            Expanded(child: _setupSubject(index))
          ],
        ));
  }

  final String key0 = "@张老师";
  final String tipText = "张三请假";
  Widget _setupSubject(int index) {
    return Stack(
      children: [
        Center(
            child: Text(_dataManager.currentDayList[index].classSubject.subject.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.grey))),
        Positioned(
          top: 10,
          left: 10,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.orange , borderRadius: BorderRadius.all(Radius.circular(4))), 
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                   text: key0, style: TextStyle(color: Colors.red, fontSize: 12)
                  ),
                  TextSpan(
                    text: tipText,
                    style: TextStyle(color: Colors.blue, fontSize: 12)),
                    ]))))
      ],
    );
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
