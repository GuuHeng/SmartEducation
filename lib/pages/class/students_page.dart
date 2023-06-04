import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_education/router.dart';

class StudentsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StudentsState();
}

enum StudentsListStyle { list, grid }

class _StudentsState extends State<StudentsPage> {
  List studentsList = [];
  List letterIndexList = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
    '#',
    '!',
    '@',
    '%'
  ];
  StudentsListStyle _listStyle = StudentsListStyle.grid;
  IconData _rightIcon = Icons.menu;
  int letterSelectedIndex = 0;
  double letterSelectedPositionY = 100.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /* String nameString = "酸辣粉就是浪费记录是京东福粒敬爱的会更好"; */
    for (var i = 0; i < 50; i++) {
      if (i < 10) {
        studentsList.add('A三丰');
      } else if (i < 15) {
        studentsList.add('B三丰');
      } else if (i < 22) {
        studentsList.add('C三丰');
      } else if (i < 25) {
        studentsList.add('D三丰');
      } else if (i < 30) {
        studentsList.add('E三丰');
      } else {
        studentsList.add('Z三丰');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("学生" + '(' + studentsList.length.toString() + ')'),
          actions: [
            IconButton(
                onPressed: () {
                  _switchListStyle();
                },
                icon: Icon(_rightIcon))
          ],
        ),
        body: _listStyle == StudentsListStyle.list
            ? setupListView()
            : setupGridView());
  }

  _switchListStyle() {
    _listStyle = _listStyle == StudentsListStyle.list
        ? StudentsListStyle.grid
        : StudentsListStyle.list;
    _rightIcon =
        _listStyle == StudentsListStyle.list ? Icons.grid_on : Icons.menu;
    setState(() {});
  }

  Stack setupListView() {
    final letterIndexHeight = 20.0;
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          right: 0,
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                String name = studentsList[index];
                return ListTile(
                  title: Text(name),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 1,
                );
              },
              itemCount: studentsList.length),
        ),
        Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            width: 12,
            child: Container(
                color: Color.fromARGB(50, 0, 0, 0),
                child: Center(
                    heightFactor: 5,
                    child: Container(
                        color: Colors.blue,
                        height: letterIndexList.length * letterIndexHeight,
                        child: GestureDetector(
                          child: ListView.builder(
                              itemCount: letterIndexList.length,
                              itemBuilder: (BuildContext context, int index) {
                                String name = letterIndexList[index];
                                return SizedBox(
                                    height: letterIndexHeight,
                                    child: Text(
                                      name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ));
                              }),
                          onVerticalDragStart: (details) {
                            double y = details.localPosition.dy;
                            int index = y ~/ letterIndexHeight; // ~/取整
                            letterSelectedPositionY = index * letterIndexHeight;

                            setState(() {
                              letterSelectedIndex = index;
                            });
                          },
                        ))))),
        Positioned(
            right: 20,
            width: 50,
            height: 50,
            top: 100,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Center(
                  child: Text(
                    letterIndexList[letterSelectedIndex],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                )))
      ],
    );
  }

  Widget updateLetterPosition() {

  }

  GridView setupGridView() {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemBuilder: (BuildContext context, int index) {
        String name = studentsList[index];
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.blue[100]),
            child: Center(child: Text(name)),
          ),
          onTap: () {
            SERouter.push(context, SERouter.studentDetailPage);
          },
        );
      },
      itemCount: studentsList.length,
    );
  }
}
