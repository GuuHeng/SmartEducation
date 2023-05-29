import 'package:flutter/material.dart';

class SubjectClassDetaiPage extends StatefulWidget {
  // 上课的课节id
  String subjectClassId;

  SubjectClassDetaiPage({Key? key, required this.subjectClassId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SubjectClassDetailState();
}

class _SubjectClassDetailState extends State<SubjectClassDetaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('课堂详情'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          buildHeader(),
          buildStudentsInfo(),
          buildSubjectClassInfo(),
        ],
      ),
    );
  }

  Widget buildHeader() {
    final timeWidget = RichText(
      text: TextSpan(children: [
        TextSpan(text: "周三", style: TextStyle(fontSize: 15, color: Colors.black)),
        TextSpan(
            text: '(上午-第一节 2023年01月01日)', style: TextStyle(fontSize: 10, color: Colors.black54))
      ]),
    );

    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[50],
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0, 0),
              blurRadius: 40,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(8))),
      height: 140,
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Center(
              child: Text(
                '数学',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 10),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  child: timeWidget,
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                Positioned(
                  child: Row(children: [
                    Icon(
                      Icons.accessibility,
                      size: 18,
                    ),
                    Text('上课教师：张益达')
                  ]),
                  top: 50,
                  left: 10,
                  right: 10,
                ),
                Positioned(
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 18,
                      ),
                      Text('上课地点：三年三班')
                    ],
                  ),
                  top: 80,
                  left: 10,
                  right: 10,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildStudentsInfo() {
    return Container(
        height: 100,
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: Colors.blue[50],
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 0),
                blurRadius: 40,
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Stack(
          children: [
            Positioned(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(text: '学生已到人数：', style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: '45',
                    style: TextStyle(
                        color: Colors.blue[900], fontWeight: FontWeight.bold, fontSize: 18)),
              ])),
              top: 10,
              left: 10,
            ),
            Positioned(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(text: '学生缺勤人数：', style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: '1',
                    style: TextStyle(
                        color: Colors.yellow[900], fontWeight: FontWeight.bold, fontSize: 18)),
              ])),
              top: 40,
              left: 10,
            ),
            Positioned(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(text: '@张珊珊', style: TextStyle(color: Colors.blue[900])),
                TextSpan(
                    text: '请假参加奥数比赛',
                    style: TextStyle(color: Colors.yellow[900], fontWeight: FontWeight.bold)),
              ])),
              top: 70,
              left: 10,
            )
          ],
        ));
  }

  Widget buildSubjectClassInfo() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 80,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: Colors.blue[50],
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0, 0),
              blurRadius: 40,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(text: '上课内容：', style: TextStyle(color: Colors.black)),
          TextSpan(
              text: '一元二次方程组（三）',
              style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold, fontSize: 20)),
        ])),
        RichText(
            text: TextSpan(children: [
          TextSpan(text: '课后作业：', style: TextStyle(color: Colors.black)),
          TextSpan(
              text: '将书本第20页第2，3题答完',
              style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold, fontSize: 15)),
        ])),
      ]),
    );
  }
}
