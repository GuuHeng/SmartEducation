import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_education/router.dart';

class StudentsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StudentsState();
}

class _StudentsState extends State<StudentsPage> {
  List studentsList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /* String nameString = "酸辣粉就是浪费记录是京东福粒敬爱的会更好"; */
    for (var i = 0; i < 50; i++) {
      studentsList.add('张三丰');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("学生" + '(' + studentsList.length.toString() + ')')),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: (BuildContext context, int index) {
          String name = studentsList[index];
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.blue[100]),
              child: Center(child: Text(name)),
            ),
            onTap: () {
              SERouter.push(context, SERouter.studentDetailPage);
            },
          );
        },
        itemCount: studentsList.length,
      ),
    );
  }
}
