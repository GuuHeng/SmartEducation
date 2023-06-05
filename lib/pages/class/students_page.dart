import 'package:flutter/material.dart';
import 'package:smart_education/router.dart';
import 'package:grouped_list/grouped_list.dart';

class StudentsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StudentsState();
}

enum StudentsListStyle { list, grid }

class _StudentsState extends State<StudentsPage> {
  List _dataList = [
    {'name': 'A 房产', 'group': 'A'},
    {'name': 'A 中介', 'group': 'A'},
    {'name': 'A 老师', 'group': 'A'},
    {'name': 'A 涨', 'group': 'A'},
    {'name': 'A 啊', 'group': 'A'},
    {'name': 'B 房产', 'group': 'B'},
    {'name': 'B 中介', 'group': 'B'},
    {'name': 'B 老师', 'group': 'B'},
    {'name': 'B 涨', 'group': 'B'},
    {'name': 'B 啊', 'group': 'B'},
    {'name': 'C 房产', 'group': 'C'},
    {'name': 'C 中介', 'group': 'C'},
    {'name': 'C 老师', 'group': 'C'},
    {'name': 'C 涨', 'group': 'C'},
    {'name': 'C 啊', 'group': 'C'},
    {'name': 'T 房产', 'group': 'T'},
    {'name': 'T 中介', 'group': 'T'},
    {'name': 'T 老师', 'group': 'T'},
    {'name': 'T 涨', 'group': 'T'},
    {'name': 'T 啊', 'group': 'T'}
  ];

  List studentsList = [];
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

  ScrollController? _scrollViewController;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
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

  Stack setupListView() {
    return Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: GroupedListView(
                stickyHeaderBackgroundColor: Colors.white,
                controller: _scrollViewController,
                elements: _dataList,
                groupBy: (element) => element['group'],
                useStickyGroupSeparators: true,
                groupSeparatorBuilder: (String value) {
                  return Container(
                    // color: Colors.black12,
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(left: 15),
                    child: Text(value),
                    height: _groupHeaderHeight,
                  );
                },
                itemBuilder: (context, element) {
                  return ListTile(
                    leading: ClipRRect(
                      child: Image.network(
                        'https://img2.baidu.com/it/u=170237391,555920326&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
                        width: 40,
                        height: 40,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    title: Text(element['name']),
                  );
                },
                separator: Divider(
                  height: 1,
                  indent: 60,
                ))),
        Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            width: 13,
            child: Container(
                color: Color.fromARGB(50, 0, 0, 0),
                child: Center(
                    heightFactor: 5,
                    child: Container(
                        // color: Colors.blue,
                        height: letterIndexList.length * letterIndexHeight,
                        child: GestureDetector(
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: letterIndexList.length,
                              itemBuilder: (BuildContext context, int index) {
                                String name = letterIndexList[index];
                                return Padding(
                                    padding: EdgeInsets.only(top: 2, bottom: 2, right: 1),
                                    child: Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(6)),
                                        child: Text(
                                          name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 9, color: Colors.white),
                                        )));
                              }),
                          onVerticalDragDown: (details) {
                            double y = details.localPosition.dy;
                            int index = y ~/ letterIndexHeight; // ~/取整

                            if (index >= 0 && index < letterIndexList.length) {
                              setState(() {
                                letterSelectedIndex = index;
                                letterSelectedPositionY = index * letterIndexHeight;

                                _scrollViewController!.animateTo(
                                    getGroupOffsetY(letterSelectedIndex),
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
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

  double getGroupOffsetY(int letterIndex) {
    if (letterIndex == 0) return 0;
    double offsetY = (letterIndex + 1) * _groupHeaderHeight + 5 * _cellHeight * letterIndex;

    final listContentHeight =
        _groupHeaderHeight * letterIndexList.length + _cellHeight * _dataList.length;

    if (listContentHeight - offsetY > context.size!.height) {
      return offsetY;
    }

    return listContentHeight - context.size!.height;
  }

  // Widget updateLetterPosition() {

  // }

  GridView setupGridView() {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemBuilder: (BuildContext context, int index) {
        String name = _dataList[index]['name'];
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
      itemCount: _dataList.length,
    );
  }
}
