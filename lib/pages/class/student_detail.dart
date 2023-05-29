import 'dart:math';

import 'package:flutter/material.dart';

class StudentDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetailPage> {
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
        appBar: AppBar(title: Text("学生档案")),
        body: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Image.network(
                    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F1a2ebf1a-fcfc-4f76-a21d-b736421f79b4%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1687962134&t=ff9f276ac8917abeedd6f426426975ae",
                    width: 80,
                    height: 80,
                  ),
                  Text('张三丰')
                ],
              ),
              height: 80,
            )
          ],
        ));
  }
}
