import 'package:flutter/material.dart';
import 'package:smart_education/util/constant.dart';

class SubjectAddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SubjectAddPageState();
  }
}

class SubjectAddPageState extends State<SubjectAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('添加课程'),
        ),
        body: Column(
          children: [
            Text("基础信息"),
            Container(
              width: 200,
              height: 100,
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Icon(Icons.abc),
                        Text("课程名称"),
                        Stack(
                          children: [Text("data")],
                        ),
                        Icon(Icons.arrow_right)
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(height: 1.0, color: Color(AppColor.list_separated_color));
                  },
                  itemCount: 2),
            )
          ],
        ));
  }
}
