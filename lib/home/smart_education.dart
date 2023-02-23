import 'package:flutter/material.dart';
import 'package:smart_education/home/home.dart';
import 'package:smart_education/home/smart_education.dart';

class SmartEducation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SmartEducationState();
  }
}

class _SmartEducationState extends State<SmartEducation>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("智慧教育"),
        ),
        body: Container(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, "weekday_timetable");
            },
            child: Text("周课表"),
          ),
        ));
  }
}
