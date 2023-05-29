import 'package:flutter/material.dart';
import 'package:smart_education/router.dart';

class ClassPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClassState();
}

class _ClassState extends State<ClassPage> {
  List hostChannels = [
    "学生",
    "成绩",
    "文化建设",
    "教师",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('班级'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          String channel = hostChannels[index];
          return GestureDetector(
            onTap: () {
              SERouter.push(context, SERouter.studentsPage);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 0),
                      blurRadius: 10,
                    )
                  ]),
              child: Stack(
                children: [
                  Center(
                    child: Text(channel),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: hostChannels.length,
      ),
    );
  }
}
