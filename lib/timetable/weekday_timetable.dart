import 'package:flutter/material.dart';

class WeekdayTimeTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WeekdayTimeTableState();
  }
}

class WeekdayTimeTableState extends State {
  final dayList = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"];

  Widget weekdayHeader() {
    return SizedBox(
        height: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue),
          child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: dayList.length),
              children: dayList.map((e) {
                return DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black12)),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text(
                              e,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                            color: Colors.white
                            ),),
                            Expanded(child: Container(
                              height: 30,
                          child: Text(
                            "11/11",
                            style: TextStyle(fontSize: 11, color: Colors.black),
                          ),
                          color: Colors.red,
                        ))
                        
                      ],
                    ));
              }).toList()),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("一周课表"),
        ),
        body: Column(
          children: [weekdayHeader()],
        ));
  }
}
