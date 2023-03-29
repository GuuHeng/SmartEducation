import 'package:flutter/material.dart';
import 'package:smart_education/home/smart_education.dart';
import 'package:smart_education/util/device.dart';
import 'package:sqflite/sqflite.dart';
import '../util/database/database_manager.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashState();
  }
}

class SplashState extends State<StatefulWidget> {
  final smartEducation = SmartEducation();
  bool splashHidden = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        splashHidden = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Offstage(
          child: smartEducation,
          offstage: !splashHidden,
        ),
        Offstage(
            child: Container(
              padding: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(color: Colors.white),
              child: Align(
                child: Text(
                  '智慧教育',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.bottomCenter,
              ),
              width: Screen.width,
              height: Screen.height,
            ),
            offstage: splashHidden)
      ],
    );
  }
}
