import 'package:flutter/material.dart';
import 'package:smart_education/timetable/weekday_timetable_data.dart';
import 'package:smart_education/util/device.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smart_education/timetable/wt_contentItem.dart';

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

  // 装填左边课节和时间的数据
  List<Lesson>? lessonList;
  // 装填这周每节课数据
  List<ClassSubject>? classSubjectList;
  // 装填这周每节课数据
  List<ClassSubjectUserData>? csUserDataList;

  WeekdayTimeTableData timeTableData = WeekdayTimeTableData();

  @override
  void initState() {
    // getData();

    List<ClassSubject> csList = timeTableData.get_weekday_classSubject_data();
    List<Lesson> leList = timeTableData.get_today_total_lesson_times();
    List<ClassSubjectUserData> csudList =
        timeTableData.get_weekday_classSubject_userdata();
    setState(() {
      this.classSubjectList = csList;
      this.lessonList = leList;
      this.csUserDataList = csudList;
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
                child: Text(e, style: TextStyle(fontWeight: FontWeight.bold),),
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
    return Column(
      children: [
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 1 / 2),
            itemCount: timeTableData.morningLessonCount,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Center(
                  child: Text(
                    (index + 1).toString() +
                        "\n" +
                        timeTableData!.morningLessonList![index].beginTime +
                        "\n" +
                        "~" +
                        "\n" +
                        timeTableData!.morningLessonList![index].endTime,
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color.fromARGB(12, 0, 0, 0),
                    border: Border(
                        right: BorderSide(width: 1, color: Colors.black12),
                        bottom: BorderSide(width: 1, color: Colors.black12))),
              );
            }),
        Padding(padding: EdgeInsets.only(top: 0)),
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 1 / 2),
            itemCount: timeTableData.afternoonLessonCount,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Center(
                  child: Text(
                    (index + 1).toString() +
                        "\n" +
                        timeTableData!.afternoonLessonList![index].beginTime +
                        "\n" +
                        "~" +
                        "\n" +
                        timeTableData!.afternoonLessonList![index].endTime,
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color.fromARGB(12, 0, 0, 0),
                    border: Border(
                        right: BorderSide(width: 1, color: Colors.black12),
                        bottom: BorderSide(width: 1, color: Colors.black12),
                        top: BorderSide(width: 1, color: Colors.black12))),
              );
            }),
            Padding(padding: EdgeInsets.only(top: 0)),
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 1 / 2),
            itemCount: timeTableData.eveningLessonCount,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Center(
                  child: Text(
                    (index + 1).toString() +
                        "\n" +
                        timeTableData!.eveningLessonList![index].beginTime +
                        "\n" +
                        "~" +
                        "\n" +
                        timeTableData!.eveningLessonList![index].endTime,
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color.fromARGB(12, 0, 0, 0),
                    border: Border(
                        right: BorderSide(width: 1, color: Colors.black12),
                        bottom: BorderSide(width: 1, color: Colors.black12),
                        top: BorderSide(width: 1, color: Colors.black12))),
              );
            }),
      ],
    );
  }

  Color itemBackgroundColor = Colors.white;

  Widget contentView() {
    return Column(
      children: [
        GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7, childAspectRatio: 1 / 2),
        itemCount: 28,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Container(
                decoration: BoxDecoration(
                    color: itemBackgroundColor,
                    border: Border(
                        right: BorderSide(width: 1, color: Colors.black12),
                        bottom: BorderSide(width: 1, color: Colors.black12))),
                child: WTContentItem(csUserData: csUserDataList![index])),
          );
        }),
        Padding(padding: EdgeInsets.only(top: 0)),
        GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7, childAspectRatio: 1 / 2),
        itemCount: 21,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(12, 0, 0, 0),
                    border: Border(
                        right: BorderSide(width: 1, color: Colors.black12),
                        bottom: BorderSide(width: 1, color: Colors.black12),
                        top: BorderSide(width: 1, color: Colors.black12))),
                child: WTContentItem(csUserData: csUserDataList![28+index])),
          );
        }),
        Padding(padding: EdgeInsets.only(top: 0)),
        GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7, childAspectRatio: 1 / 2),
        itemCount: 21,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        right: BorderSide(width: 1, color: Colors.black12),
                        bottom: BorderSide(width: 1, color: Colors.black12),
                        top: BorderSide(width: 1, color: Colors.black12))),
                child: WTContentItem(csUserData: csUserDataList![28+21+index])),
          );
        }),
      ],
    );
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
