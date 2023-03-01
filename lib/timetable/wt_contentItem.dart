import 'package:flutter/material.dart';
import 'package:smart_education/timetable/weekday_timetable_data.dart';

class WTContentItem extends StatefulWidget {
  ClassSubjectUserData csUserData;

  WTContentItem({Key? key, required this.csUserData}):super(key: key);

  // ignore: empty_constructor_bodies
  @override
  State<StatefulWidget> createState() {
    return WTContentItemState();
  }
}

class WTContentItemState extends State<WTContentItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 10,
            right: 10,
            child: 
            Text(widget.csUserData.classSubject.subject.name)
          ),
          widget.csUserData.tipList != null ? Positioned(
            top: 50,
            left: 2,
            right: 2,
            child: Text(widget.csUserData.tipList!.first.toString(), style: TextStyle(backgroundColor: Colors.pink),)) : Text(""),
          
          widget.csUserData.isPayAttention ? 
          Positioned(
            bottom: 5,
            right: 5,
            child: ClipOval(
              child: Container(
                color: Colors.red,
              width: 15,
              height: 15,
              child: Center(
                child: Text("考", textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Colors.white),
              )),
            ),
          )) : Positioned(child: Text(""))
        ],
      ),
    );
  }
}
