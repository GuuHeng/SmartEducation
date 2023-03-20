import 'package:flutter/material.dart';
import 'package:smart_education/router.dart';
import 'package:smart_education/timetable/data/weekday_timetable_data.dart';
import 'package:smart_education/util/database/database_manager.dart';
import 'timetable_settings.dart';
import 'weekday_timetable.dart';
import 'package:smart_education/timetable/data/timetable_data_manager.dart';
import 'package:smart_education/models/subject_model.dart';

class TimeTable extends StatefulWidget {
  VoidCallback? onTapLeadingCallback;

  @override
  State<StatefulWidget> createState() {
    return _TimeTableState();
  }
}

class _TimeTableState extends State<TimeTable> {
  // 时间区域的宽度
  final double timeAreaWidth = 50;
  TimeTableDataManager _dataManager = TimeTableDataManager.dataManager;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      _dataManager.get_today_timetable_data();
    });

    // List<Subject> subjects = <Subject>[];
    // for (int index = 0; index < _dataManager.weekdayTimeTableData.subjects.length; index++) {
    //   Subject s = Subject(index.toString(), _dataManager.weekdayTimeTableData.subjects[index]);
    //   subjects.add(s);
    // }
    // DatabaseManager().insertSubjects(subjects);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("今日课表"),
        leading: IconButton(
            onPressed: () {
              widget.onTapLeadingCallback!();
            },
            icon: Icon(Icons.menu)),
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
      // drawer: TimeTableSettings(),
    );
  }

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
                child: Center(
                    child: Text(_dataManager.currentDayLessonTimeList.isNotEmpty
                        ? _dataManager.currentDayLessonTimeList[index].beginTime +
                            "~" +
                            _dataManager.currentDayLessonTimeList[index].endTime
                        : '')),
              ),
            ),
            Expanded(child: _setupSubject(index))
          ],
        ));
  }

  Widget _setupSubject(int index) {
    if (_dataManager.currentDayList.isEmpty) {
      return Text('data');
    }
    ClassSubjectUserData data = _dataManager.currentDayList[index];
    List<ClassSubjectPayAttention>? _payAttentionList;
    if (data.payAttentionList != null) {
      _payAttentionList = data.payAttentionList!;
    }

    return Stack(
      children: [
        Center(
            child: Text(_dataManager.currentDayList[index].classSubject.subject.name,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.grey))),
        _payAttentionView(_payAttentionList)
      ],
    );
  }

  Widget _payAttentionView(List<ClassSubjectPayAttention>? payAttentionList) {
    if (payAttentionList == null || payAttentionList.isEmpty) {
      return SizedBox();
    }

    List<ClassSubjectPayAttention> paList = payAttentionList;
    return Positioned(
        top: 10,
        left: 10,
        child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(4))),
            child: RichText(
                text: TextSpan(children: [
              paList.first.student != null
                  ? TextSpan(
                      text: paList.first.student!.name,
                      style: TextStyle(color: Colors.red, fontSize: 12))
                  : TextSpan(),
              TextSpan(
                  text: paList.first.message, style: TextStyle(color: Colors.white, fontSize: 12))
            ]))));
  }

  void switchTimeTable(BuildContext context) {
    setState(() {
      SERouter.push(context, SERouter.timetableWeekdayPage);
    });
  }

  void openSetting() {
    Scaffold.of(context).openDrawer();
  }
}
