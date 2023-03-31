import 'package:flutter/material.dart';
import 'package:smart_education/models/subject_model.dart';
import 'package:smart_education/util/constant.dart';

class SubjectAddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SubjectAddPageState();
  }
}

class SubjectAddPageState extends State<SubjectAddPage> {
  var subjectName = "";
  var subjectColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(244, 244, 244, 1),
        appBar: AppBar(
          title: Text('添加课程'),
        ),
        body: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                Container(
                  color: Colors.blue,
                  margin: EdgeInsets.only(left: 10),
                  height: 20,
                  child: Text(
                    "基础信息",
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1.0, color: Color.fromRGBO(234, 238, 244, 1)),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    height: 120,
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Container(
                              height: 60,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20, right: 5),
                                    child: Icon(Icons.access_alarm),
                                  ),
                                  Text(
                                    "课程名称",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Expanded(
                                    child: Stack(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(
                                          "data",
                                          textAlign: TextAlign.right,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Icon(Icons.arrow_right),
                                  )
                                ],
                              ),
                            );
                          } else {
                            return Container(
                              height: 60,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 20, right: 5),
                                    child: Icon(Icons.access_alarm),
                                  ),
                                  Text(
                                    "颜色",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Expanded(
                                    child: Stack(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Text(
                                          "data",
                                          textAlign: TextAlign.right,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Icon(Icons.arrow_right),
                                  )
                                ],
                              ),
                            );
                          }
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            color: Color.fromRGBO(234, 238, 244, 1),
                            indent: 20,
                            endIndent: 20,
                            height: 1,
                          );
                        },
                        itemCount: 2))
              ],
            )),
            Container(
                height: isPaddingScreen() == true ? 90 : 60,
                color: Colors.white,
                child: SafeArea(
                  child: Stack(
                    children: [
                      Positioned(
                          left: 20,
                          right: 20,
                          bottom: 0,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "完成",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.blue),
                                fixedSize: MaterialStateProperty.all(Size.fromHeight(40))),
                          ))
                    ],
                  ),
                )),
          ],
        ));
  }

  bool isPaddingScreen() {
    return MediaQuery.of(context).padding.bottom > 0;
  }
}
