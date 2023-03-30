import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_education/models/subject_model.dart';
import 'package:smart_education/router.dart';
import 'package:smart_education/timetable/data/timetable_data_manager.dart';
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

    EasyLoading.show();
    _databaseManager.queryAllSubjects().then((value) {
      if (value == null || value.length == 0) {
        TimeTableDataManager().setup().then((v) {
          TimeTableDataManager().subjects.map((e) {
            subjectList.add(e);
          }).toList();
          setState(() {});
        }).whenComplete(() {
          EasyLoading.dismiss();
        });
      } else {
        value.map((e) {
          subjectList.add(Subject.fromJson(e));
          setState(() {});
        }).toList();
      }
    }).catchError((e) {
      EasyLoading.dismiss();
    });
    return;
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
        appBar: AppBar(title: Text('课程管理'), actions: [
          IconButton(
              onPressed: () {
                SERouter.push(context, SERouter.subjectAddPage);
              },
              icon: Icon(Icons.add))
        ]),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Icon(
                        Icons.macro_off,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      subjectList[index].name,
                      textAlign: TextAlign.center,
                    ),
                    Expanded(
                        child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          child: Icon(
                            Icons.arrow_right_sharp,
                          ),
                          right: 10,
                        ),
                      ],
                    ))
                  ],
                ),
                height: 60,
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(234, 228, 228, 222), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
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
