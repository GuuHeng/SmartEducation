import 'package:flutter/material.dart';
import 'package:smart_education/timetable/weekday_timetable_data.dart';
import 'package:smart_education/util/device.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class WeekdayTimeTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WeekdayTimeTableState();
  }
}

class WeekdayTimeTableState extends State {
  final dayList = ["", "周一", "周二", "周三", "周四", "周五", "周六", "周日"];

  // 一天10节课
  int lessonCount = 10;

  List<Lesson>? lessonList;
  List<ClassSubject>? classSubjectList;

  WeekdayTimeTableData timeTableData = WeekdayTimeTableData();


  @override
  void initState() {
    // getData();

    List<ClassSubject> csList = timeTableData.get_weekday_classSubject_data();
    List<Lesson> leList = timeTableData.get_today_total_lesson_times();
    setState(() {
      this.classSubjectList = csList;
      this.lessonList = leList;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("一周课表"),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          weekdayHeader(),
          Expanded(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                  child: Row(
            children: [
              Expanded(flex: 1, child: timeView()),
              Expanded(flex: 7, child: contentView())
            ],
          )))
        ]));
  }

  void getData() {
    Future() {
      List<ClassSubject> data =
          WeekdayTimeTableData().get_weekday_classSubject_data();
      setState(() {
        this.classSubjectList = data;
      });
    }
  }

  Widget weekdayHeader() {
    return SizedBox(
      // height: WeekdayTimeTableUX.headerHeight,
      child: GridView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: dayList.length, childAspectRatio: 1),
          children: dayList.map((e) {
            return Container(
              child: Center(
                child: Text(e),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(12, 0, 0, 0),
                  border: Border(
                      right: BorderSide(width: 1, color: Colors.black12),
                      bottom: BorderSide(width: 1, color: Colors.black12))),
            );
          }).toList()),
    );
  }

  Widget timeView() {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1 / 2),
        itemCount: lessonCount,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Text(
                (index + 1).toString() + "\n" + lessonList![index].beginTime + "\n" + "~"  + "\n"+ lessonList![index].endTime,
                textAlign: TextAlign.center,
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(12, 0, 0, 0),
                border: Border(
                    right: BorderSide(width: 1, color: Colors.black12),
                    bottom: BorderSide(width: 1, color: Colors.black12))),
          );
        });
  }

  Color itemBackgroundColor = Colors.red;

  Widget contentView() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7, childAspectRatio: 1 / 2),
        itemCount: 70,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              itemBackgroundColor = Colors.blue;
              setState(() {
                
              });
            },
            child: Container(
            decoration: BoxDecoration(
              color: itemBackgroundColor,
                border: Border(
                    right: BorderSide(width: 1, color: Colors.black12),
                    bottom: BorderSide(width: 1, color: Colors.black12))),
            child: Stack(
              children: [
                Positioned(
                  child: Text(
                    (this.classSubjectList != null
                        ? this.classSubjectList![index].subject.name
                        : ""),
                    style: TextStyle(fontSize: 13.0, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                const Positioned(
                  child: Text(
                    "提示",
                    style: TextStyle(fontSize: 11.0, color: Colors.green),
                    textAlign: TextAlign.center,
                  ),
                  top: 40,
                  left: 10,
                  right: 10,
                )
              ],
            ),
          ),
          );
        });
  }
}

class WeekdayTimeTableUX {
  static double headerHeight = 40;
  static double timeAreaWidth = 40;
  static double timeAreaHeight =
      Screen.height - Screen.navigatorBar_height - headerHeight - 12;
  static double timeAreaSubHeight = 100;
  static double contentAreaWidth = Screen.width - timeAreaWidth;
  static double contentAreaHeight = timeAreaHeight;
  static Color headerBackgroundColor = Colors.white;
  static Color timeAreaBackgroundColor = Colors.white;
  static Color contentAreaBackgroundColor = Colors.white;
}
