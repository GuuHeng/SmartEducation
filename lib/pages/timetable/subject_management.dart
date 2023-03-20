import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_education/models/subject_model.dart';
import 'package:smart_education/util/database/database_manager.dart';

import '../../util/constant.dart';

class SubjectManagementPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SubjectManagementPageState();
  }
}

class _SubjectManagementPageState extends State<SubjectManagementPage> {
  List<Subject> subjectList = <Subject>[];
  DatabaseManager _databaseManager = DatabaseManager();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getSubjectsData();
  }

  _getSubjectsData() async {
    if (_databaseManager.db?.isOpen == true) {
      List<Map<String, Object?>>? list = await _databaseManager.queryAllSubjects();
      if (list != null && list.isNotEmpty) {
        list.map((e) {
          subjectList.add(Subject.fromJson(e));
        }).toList();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('课程管理')),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Icon(Icons.macro_off),
                  Text(subjectList[index].name),
                  Icon(Icons.arrow_right)
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 1,
                color: Color(AppColor.list_separated_color),
              );
            },
            itemCount: subjectList.length));
  }
}
