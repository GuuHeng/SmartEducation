import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_education/timetable/data/weekday_timetable_data.dart';

import '../util/constant.dart';

class SubjectManagementPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SubjectManagementPageState();
  }
}

class _SubjectManagementPageState extends State<SubjectManagementPage> {
  List<Subject> subjectList = <Subject>[];

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();



  }

  _getSubjectsData() {
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('课程管理')),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [Icon(Icons.macro_off), Text("数学"), Icon(Icons.arrow_right)],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 1,
                color: Color(AppColor.list_separated_color),
              );
            },
            itemCount: 10));
  }
}
