import 'package:flutter/material.dart';
import 'package:smart_education/pages/timetable/subject_add_page.dart';
import 'pages/timetable/subject_add_editName_page.dart';
import 'pages/timetable/subject_management.dart';
import 'pages/timetable/timetable.dart';
import 'pages/timetable/timetable_management.dart';
import 'pages/timetable/timetable_settings.dart';
import 'pages/timetable/weekday_timetable.dart';
import 'pages/timetable/subject_log/subject_class_detail.dart';
import 'pages/class/students_page.dart';

class SERouter {
  static const timetablePage = 'timetable/today';
  static const timetableWeekdayPage = 'timetable/weekday';
  static const timetableSettingPage = 'timetable/setting';

  static const timetableManagementPage = 'timetable/management/timetable';
  static const subjectManagementPage = 'timetable/management/subject';
  static const subjectAddPage = 'timetable/management/subject/add';
  static const subjectAddNamePage = 'timetable/management/subject/add/name';
  static const subjectClassDetailPage = 'timetable/subjectClass/detail'; // 该节课的详情
  static const studentsPage = 'class/students';
  Widget _generatePage(String url, dynamic params) {
    switch (url) {
      case timetablePage:
        return TimeTable();
      case timetableWeekdayPage:
        return WeekdayTimeTable();
      case timetableSettingPage:
        return TimeTableSettings();
      case timetableManagementPage:
        return TimetableManagementPage();
      case subjectManagementPage:
        return SubjectManagementPage();
      case subjectAddPage:
        return SubjectAddPage();
      case subjectAddNamePage:
        return SubjectAddNamePage();
      case subjectClassDetailPage:
        return SubjectClassDetaiPage(subjectClassId: params);
      case studentsPage:
        return StudentsPage();
    }
    return Scaffold();
  }

  SERouter.pushParams(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return _generatePage(url, params);
    }));
  }

  SERouter.push(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return _generatePage(url, null);
    }));
  }
}
