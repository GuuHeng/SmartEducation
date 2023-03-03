// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:smart_education/timetable/data/weekday_timetable_data.dart';
import 'package:smart_education/util/device.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smart_education/timetable/wt_contentItem.dart';
import 'package:smart_education/timetable/data/timetable_data_manager.dart';

class WeekdayTimeTable extends StatefulWidget {
  const WeekdayTimeTable({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
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
  List<ClassSubjectUserData>? csUserDataList;

  TimeTableDataManager _dataManager = TimeTableDataManager.dataManager;
  late WeekdayTimeTableData timeTableData;
  @override
  void initState() {
    super.initState();

    // List<ClassSubject> csList = timeTableData.get_weekday_classSubject_data();
    // List<Lesson> leList = timeTableData.get_today_total_lesson_times();
    // List<ClassSubjectUserData> csudList =
    //     timeTableData.get_weekday_classSubject_userdata();

    timeTableData = _dataManager.weekdayTimeTableData;
    List<Lesson> leList = _dataManager.currentDayLessonTimeList;
    List<ClassSubjectUserData> csudList = _dataManager.currentDayList;

    setState(() {
      lessonList = leList;
      csUserDataList = _dataManager.weekdayTimeTableData.allCSUserDataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("一周课表"),
          actions: [_popupMenuButton()],
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          weekdayHeader(),
          Expanded(
              child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: timeView()),
                      Expanded(flex: 7, child: contentView())
                    ],
                  )))
        ]));
  }

  PopupMenuButton _popupMenuButton() {
    return PopupMenuButton(itemBuilder: (context) {
      return timeTableData.subjects
          .map((e) => PopupMenuItem(
                child: Text(e),
                onTap: () {
                  if (csUserDataList != null) {
                    setState(() {
                      List<ClassSubjectUserData> list = csUserDataList!;
                      for (int index = 0; index < list.length; index++) {
                        ClassSubjectUserData data = list[index];
                        data.isHighlighted = data.classSubject.subject.name == e;
                      }
                    });
                  }
                },
              ))
          .toList();
    });
  }

  Widget weekdayHeader() {
    return SizedBox(
      // height: WeekdayTimeTableUX.headerHeight,
      child: GridView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: dayList.length, childAspectRatio: 1),
          children: dayList.map((e) {
            return Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(12, 0, 0, 0),
                  border: Border(
                      right: BorderSide(width: 1, color: Colors.black12),
                      bottom: BorderSide(width: 1, color: Colors.black12))),
              child: Center(
                child: Text(
                  e,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
          }).toList()),
    );
  }

  Widget timeView() {
    return Column(
      children: [
        setup_time_itemsView(timeTableData.morningLessonCount, timeTableData.morningLessonList!),
        const Padding(padding: EdgeInsets.only(top: 0)),
        setup_time_itemsView(
            timeTableData.afternoonLessonCount, timeTableData.afternoonLessonList!),
        const Padding(padding: EdgeInsets.only(top: 0)),
        setup_time_itemsView(timeTableData.eveningLessonCount, timeTableData.eveningLessonList!),
      ],
    );
  }

  Color itemBackgroundColor = Colors.white;

  Widget contentView() {
    return Column(
      children: [
        setup_classSubjects_itemsView(28, csUserDataList!.sublist(0, 28)),
        const Padding(padding: EdgeInsets.only(top: 0)),
        setup_classSubjects_itemsView(21, csUserDataList!.sublist(28, 28 + 21)),
        const Padding(padding: EdgeInsets.only(top: 0)),
        setup_classSubjects_itemsView(21, csUserDataList!.sublist(28 + 21, 28 + 21 + 21)),
      ],
    );
  }

  Widget setup_time_itemsView(int itemCount, List<Lesson> lessonList) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1 / 2),
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(12, 0, 0, 0),
                border: Border(
                  right: BorderSide(width: 1, color: Colors.black12),
                  bottom: BorderSide(width: 1, color: Colors.black12),
                ),
              ),
              child: Center(
                child: Text(
                  "${index + 1}\n${lessonList[index].beginTime}\n~\n${lessonList[index].endTime}",
                  // (index + 1).toString() +
                  //     "\n" +
                  //     lessonList[index].beginTime +
                  //     "\n" +
                  //     "~" +
                  //     "\n" +
                  //     lessonList[index].endTime,
                  textAlign: TextAlign.center,
                ),
              ));
        });
  }

  Widget setup_classSubjects_itemsView(int itemCount, List<ClassSubjectUserData> csUserDataList) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7, childAspectRatio: 1 / 2),
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              String tipText = "";

              List<ClassSubjectPayAttention>? payAttentionList =
                  csUserDataList[index].payAttentionList;
              if (payAttentionList != null) {
                for (int i = 0; i < payAttentionList.length; i++) {
                  tipText = tipText + "\n" + payAttentionList[i].message;
                }
              }
              if (tipText.isNotEmpty) {
                EasyLoading.showToast(tipText);
              }
            },
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      right: BorderSide(width: 1, color: Colors.black12),
                      bottom: BorderSide(width: 1, color: Colors.black12),
                    )),
                child: WTContentItem(csUserData: csUserDataList[index])),
          );
        });
  }
}

class WeekdayTimeTableUX {
  static double headerHeight = 40;
  static double timeAreaWidth = 40;
  static double timeAreaHeight = Screen.height - Screen.navigatorBar_height - headerHeight - 12;
  static double timeAreaSubHeight = 100;
  static double contentAreaWidth = Screen.width - timeAreaWidth;
  static double contentAreaHeight = timeAreaHeight;
  static Color headerBackgroundColor = Colors.white;
  static Color timeAreaBackgroundColor = Colors.white;
  static Color contentAreaBackgroundColor = Colors.white;
}
