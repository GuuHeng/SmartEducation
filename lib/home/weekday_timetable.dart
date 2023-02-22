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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("一周课表"),
      ),
      body: Column(
        children: [
          SizedBox(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7, childAspectRatio: 1),
              children: [
                Column(
                  children: [Text("")],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
