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

  Widget weekdayHeader() {
    return SizedBox(
        height: 100,
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
              children: [
                Container(
                  width: 100,
                  height: 300,
                  child:Column(
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
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: contentView(),
                )
              ],
            )
          ],
        ));
  }

  Widget contentView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7), 
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
      return Container(
        width: 100,
        height: 100,
        child: Stack(
          children: [
            Positioned(child: Text("语文", style: TextStyle(fontSize: 13.0, color: Colors.black),), top: 10, left: 10,),
            Positioned(child: Text("提示", style: TextStyle(fontSize: 11.0, color: Colors.green)), top: 50, left: 10,)
          ],
        ),
      );
    });
  }
}