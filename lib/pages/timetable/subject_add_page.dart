import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:smart_education/models/subject_model.dart';
import 'package:smart_education/pages/timetable/subject_add_editName_page.dart';
import 'package:smart_education/router.dart';
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
            Column(
              children: [
                Container(
                  // color: Colors.blue,
                  height: 50,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Text(
                          "基础信息",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        left: 20,
                        top: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1.0, color: Color.fromRGBO(234, 238, 244, 1)),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: 120,
                    child: buildListView())
              ],
            ),
            buildFinishView()
          ],
        ));
  }

  Widget buildListView() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return GestureDetector(
              child: buildListItem("课程名称", false),
              onTap: () {
                SERouter.push(context, SERouter.subjectAddNamePage);
              });
        } else {
          return buildListItem("颜色", true);
        }
      },
      separatorBuilder: (BuildContext context, int index) {
        return buildListSeparator();
      },
    );
  }

  Widget buildListItem(String title, bool isColor) {
    return Container(
      height: 60,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 5),
            child: Icon(Icons.access_alarm),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 15),
          ),
          Expanded(
            child: Stack(
              textDirection: TextDirection.rtl,
              children: [
                isColor
                    ? Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.red),
                      )
                    : Text(
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

  Widget buildListSeparator() {
    return Divider(
      color: Color.fromRGBO(234, 238, 244, 1),
      indent: 20,
      endIndent: 20,
      height: 1,
    );
  }

  Widget buildFinishView() {
    return Container(
        height: isPaddingScreen() == true ? 90 : 60,
        // color: Colors.white,
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
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        // fixedSize: Size(100, 40)
                      )))
            ],
          ),
        ));
  }

  bool isPaddingScreen() {
    return MediaQuery.of(context).padding.bottom > 0;
  }
}
