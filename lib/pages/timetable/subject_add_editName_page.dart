import 'package:flutter/material.dart';

class SubjectAddNamePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SubjectAddNamePageState();
}

class SubjectAddNamePageState extends State<SubjectAddNamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('编辑课程名称'),
      ),
    );
  }
}
