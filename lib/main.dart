import 'package:flutter/material.dart';
import 'package:smart_education/home/smart_education.dart';
import 'package:smart_education/timetable/timetable.dart';
import 'package:smart_education/timetable/weekday_timetable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MaterialApp(
    home: SmartEducation(),
    routes: {
      'home': (context) => SmartEducation(),
      'timetable': (context) => TimeTable(),
      'weekday_timetable': (context) => WeekdayTimeTable(),
    },
    builder: EasyLoading.init(),
    debugShowCheckedModeBanner: false,
  ));
}
