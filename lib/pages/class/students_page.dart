import 'package:flutter/material.dart';
import 'package:smart_education/router.dart';
// import 'package:sticky_grouped_list/sticky_grouped_list.dart';
import 'package:smart_education/util/device.dart';
import 'package:easy_sticky_header/easy_sticky_header.dart';

class StudentsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StudentsState();
}

enum StudentsListStyle { list, grid }

class _StudentsState extends State<StudentsPage> {
  List _dataList = [
    {'section': 'A'},
    {'name': 'A 1房产', 'group': 'A'},
    {'name': 'A 2中介', 'group': 'A'},
    {'name': 'A 3老师', 'group': 'A'},
    {'name': 'A 4涨', 'group': 'A'},
    {'name': 'A 5啊', 'group': 'A'},
    {'section': 'B'},
    {'name': 'B 1房产', 'group': 'B'},
    {'name': 'B 2中介', 'group': 'B'},
    {'name': 'B 3老师', 'group': 'B'},
    {'name': 'B 4涨', 'group': 'B'},
    {'name': 'B 5啊', 'group': 'B'},
    {'section': 'C'},
    {'name': 'C 1房产', 'group': 'C'},
    {'name': 'C 2中介', 'group': 'C'},
    {'name': 'C 3老师', 'group': 'C'},
    {'name': 'C 4涨', 'group': 'C'},
    {'name': 'C 5啊', 'group': 'C'},
    {'section': 'T'},
    {'name': 'T 1房产', 'group': 'T'},
    {'name': 'T 2中介', 'group': 'T'},
    {'name': 'T 3老师', 'group': 'T'},
    {'name': 'T 4涨', 'group': 'T'},
    {'name': 'T 5啊', 'group': 'T'}
  ];

  List _studentList = [];
  List letterIndexList = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'T',
  ];
  StudentsListStyle _listStyle = StudentsListStyle.grid;
  IconData _rightIcon = Icons.menu;
  int letterSelectedIndex = 0;

  double letterSelectedPositionY = 0.0;
  final _groupHeaderHeight = 40.0;
  final _cellHeight = 50.0;
  final letterIndexHeight = 16.0;

  final StickyHeaderController _headerController = StickyHeaderController();

  @override
  void initState() {
    super.initState();

    _dataList.forEach((element) {
      Map e = element;
      if (e.containsKey('name') == true) {
        _studentList.add(element);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("学生" + '(' + _dataList.length.toString() + ')'),
          actions: [
            IconButton(
                onPressed: () {
                  _switchListStyle();
                },
                icon: Icon(_rightIcon))
          ],
        ),
        body: _listStyle == StudentsListStyle.list ? setupListView() : setupGridView());
  }

  _switchListStyle() {
    _listStyle =
        _listStyle == StudentsListStyle.list ? StudentsListStyle.grid : StudentsListStyle.list;
    _rightIcon = _listStyle == StudentsListStyle.list ? Icons.grid_on : Icons.menu;
    setState(() {});
  }

  Widget setupListSticky() {
    return StickyHeader(
        controller: _headerController,
        child: ListView.builder(
          itemBuilder: (context, index) {
            Map e = _dataList[index];
            if (e.containsKey('section') == true) {
              return StickyContainerWidget(
                index: index,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 16.0),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: 50,
                  child: Text(
                    _dataList[index]['section'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }

            // Custom item widget.
            return ListTile(
              leading: ClipRRect(
                child: Image.network(
                  'https://img2.baidu.com/it/u=170237391,555920326&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
                  width: 40,
                  height: 40,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              title: Text(
                _dataList[index]['name'],
              ),
            );
          },
          itemCount: _dataList.length,
        ));
  }

  // List<Widget> setupListContent() {
  //   return letterIndexList.map((data, index) => {
  //     letterSelectedIndex = index;
  //     letterSelectedPositionY = letterSelectedIndex * letterIndexHeight;
  //     return setupListSticky();
  //   });
  // }

  List<Widget> setupLetterListView() {
    List<Widget> views = [];
    letterIndexList.forEach((element) {
      String name = element;
      var c = Padding(
          padding: EdgeInsets.only(top: 2, bottom: 2, right: 1),
          child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(6)),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 9, color: Colors.white),
              )));
      views.add(c);
    });
    return views;
  }

  Stack setupListView() {
    return Stack(
      children: [
        Positioned(top: 0, left: 0, bottom: 0, right: 0, child: setupListSticky()),
        Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            width: 13,
            child: Container(
                color: Color.fromARGB(50, 0, 0, 0),
                child: Center(
                    // heightFactor: 5,
                    child: Container(
                        // color: Colors.blue,
                        height: letterIndexList.length * letterIndexHeight,
                        child: GestureDetector(
                          child: Column(children: setupLetterListView()),
                          onVerticalDragDown: (details) {
                            double y = details.localPosition.dy;
                            int index = y ~/ letterIndexHeight; // ~/取整

                            if (index >= 0 && index < letterIndexList.length) {
                              setState(() {
                                letterSelectedIndex = index;
                                letterSelectedPositionY = index * letterIndexHeight;

                                for (var i = 0; i < _dataList.length; i++) {
                                  Map e = _dataList[i];
                                  if (e.containsKey('section') == true) {
                                    if (e['section'] == letterIndexList[index]) {
                                      int eIndex = _dataList.indexOf(e);
                                      _headerController.animateTo(eIndex);
                                      break;
                                    }
                                  }
                                }
                              });
                            }
                          },
                          onVerticalDragUpdate: (details) {
                            double y = details.localPosition.dy;
                            int index = y ~/ letterIndexHeight; // ~/取整

                            if (index >= 0 && index < letterIndexList.length) {
                              setState(() {
                                letterSelectedIndex = index;
                                letterSelectedPositionY = index * letterIndexHeight;

                                for (var i = 0; i < _dataList.length; i++) {
                                  Map e = _dataList[i];
                                  if (e.containsKey('section') == true) {
                                    if (e['section'] == letterIndexList[index]) {
                                      int eIndex = _dataList.indexOf(e);
                                      _headerController.animateTo(eIndex);
                                      break;
                                    }
                                  }
                                }
                              });
                            }
                          },
                        ))))),
        Positioned(
            right: 20,
            width: 50,
            height: 50,
            top: 100,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black54, borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Center(
                  child: Text(
                    letterIndexList[letterSelectedIndex],
                    style:
                        TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                )))
      ],
    );
  }

  double getGroupIndex(int letterIndex) {
    if (letterIndex == 0) return 0;
    double offsetY = (letterIndex + 1) * _groupHeaderHeight + 5 * _cellHeight * letterIndex;

    final bodyHeight = Screen.height - Screen.navigatorBar_height;

    final listContentHeight =
        _groupHeaderHeight * letterIndexList.length + _cellHeight * _dataList.length;

    if (listContentHeight - offsetY > bodyHeight) {
      return (letterIndex + 1) * 5;
    }

    // (listContentHeight - bodyHeight)

    return listContentHeight - bodyHeight;
  }

  // Widget updateLetterPosition() {

  // }

  GridView setupGridView() {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemBuilder: (BuildContext context, int index) {
        String name = _studentList[index]['name'];
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
      itemCount: _studentList.length,
    );
  }
}
