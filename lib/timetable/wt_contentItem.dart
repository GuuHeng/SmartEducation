import 'package:flutter/material.dart';
import 'package:smart_education/timetable/data/weekday_timetable_data.dart';

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
      color: widget.csUserData.isHighlighted == true ? Colors.orange : Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 10,
            right: 10,
            child: 
            Text(widget.csUserData.classSubject.subject.name)
          ),
          widget.csUserData.tipList != null ? 
          Positioned(
            top: 50,
            left: 2,
            right: 2,
            child: Container(
              child: Text(widget.csUserData.tipList!.first.toString(), style: TextStyle(fontSize: 10), maxLines: 1, textAlign: TextAlign.center,),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)), color: Colors.yellow),)
            ) : Text(""),
          widget.csUserData.payAttentionList != null ? 
          Positioned(
            bottom: 5,
            right: 5,
            child: ClipOval(
              child: Container(
                color: Colors.red,
              width: 10,
              height: 10,),
            ),
          ) : Positioned(child: Text("")),
          widget.csUserData.event.isNotEmpty ?
          Positioned(
            bottom: 5,
            right: 22,
            child: ClipOval(
              child: Container(
                width: 15,
                height: 15,
                color: Colors.blue,
                child: Center(
                  child: Text(widget.csUserData.event.substring(0, 1), textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Colors.white),
              ),)))) : Text("")
        ],
      ),
    );
  }
}
