import 'dart:ffi';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:smart_education/util/device.dart';

class WeekdayTimeTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WeekdayTimeTableState();
  }
}

class WeekdayTimeTableState extends State {
  final dayList = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("一周课表"),
        ),
        body: Column(
          children: [
            weekdayHeader(),
            Row(
              children: [timeView(), contentView()],
            )
          ],
        ));
  }

  Widget weekdayHeader() {
    return SizedBox(
        height: WeekdayTimeTableUX.headerHeight,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue),
          child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: dayList.length),
              physics: NeverScrollableScrollPhysics(),
              children: dayList.map((e) {
                return DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black12),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                            child: Text(
                              e,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                            color: Colors.pink),
                        Container(
                          height: 15,
                          child: Text(
                            "11/11",
                            style: TextStyle(fontSize: 11, color: Colors.black),
                          ),
                          color: Colors.red,
                        )
                      ],
                    ));
              }).toList()),
        ));
  }

  

  Widget timeView() {
    return Container(
      width: WeekdayTimeTableUX.timeAreaWidth,
      height: WeekdayTimeTableUX.timeAreaHeight,
      child: Column(
        children: [
          Expanded(child: Text("aaaa")),
          Expanded(child: Text("aaaa")),
          Expanded(child: Text("aaaa")),
          Expanded(child: Text("aaaa")),
          Expanded(child: Text("aaaa")),
          Expanded(child: Text("aaaa")),
          Expanded(child: Text("aaaa")),
          Expanded(child: Text("aaaa")),
        ],
      ),
      color: Colors.red,
    );
  }

  Widget contentView() {
    return SizedBox(
        width: WeekdayTimeTableUX.contentAreaWidth,
        height: WeekdayTimeTableUX.contentAreaHeight,
        child: Container(
          color: Colors.pink,
          child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
              itemCount: 70,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 40,
                  height: 60,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Text(
                          "语文",
                          style: TextStyle(fontSize: 13.0, color: Colors.black),
                        ),
                        top: 10,
                        left: 10,
                      ),
                      Positioned(
                        child: Text("提示",
                            style:
                                TextStyle(fontSize: 11.0, color: Colors.green)),
                        top: 20,
                        left: 10,
                      )
                    ],
                  ),
                );
              }),
        ));
  }
}

class WeekdayTimeTableUX {
  static double headerHeight = 40;
  static double timeAreaWidth = 40;
  static double timeAreaHeight = 400;
  static double contentAreaWidth = Screen.width - timeAreaHeight;
  static double contentAreaHeight = Screen.height - Screen.navigatorBar_height;
}
