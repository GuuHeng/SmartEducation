import 'package:flutter/material.dart';
import 'package:smart_education/home/smart_education.dart';
import 'pages/splash.dart';
import 'pages/timetable/timetable.dart';
import 'pages/timetable/weekday_timetable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'router.dart';
import 'pages/timetable/subject_management.dart';

final global_key_navigator = new GlobalKey<NavigatorState>();

void main() {
  runApp(MaterialApp(
    home: Splash(),
    navigatorKey: global_key_navigator,
    // routes: {
    //   SERouter.timetablePage: (context) => TimeTable(),
    //   SERouter.timetableWeekdayPage: (context) => WeekdayTimeTable(),
    //   SERouter.subjectManagementPage: (context) => SubjectManagementPage(),
    // },
    builder: EasyLoading.init(),
    debugShowCheckedModeBanner: false,
  ));
}
