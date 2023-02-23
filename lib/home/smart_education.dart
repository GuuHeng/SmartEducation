import 'package:flutter/material.dart';
import 'package:smart_education/home/home.dart';

class SmartEducation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SmartEducationState();
  }
}

class _SmartEducationState extends State<SmartEducation>
    with TickerProviderStateMixin {
  List tabs = ["HomePage111111111111", "Items"];
  late TabController _tabController;

  List<BottomNavigationBarItem> _bottomNavigationList = [
    BottomNavigationBarItem(icon: Icon(Icons.holiday_village), label: "首页"),
    BottomNavigationBarItem(icon: Icon(Icons.hail_outlined), label: "我的")
  ];

  var _currentIndex = 0;
  void tapItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("智慧教育"),
            ),
            body: TabBarView(
                controller: _tabController,
                children: tabs.map((e) {
                  return Container(child: Text(e));
                }).toList()),
            bottomNavigationBar: BottomNavigationBar(
              items: _bottomNavigationList,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.blue,
              currentIndex: _currentIndex,
              onTap: (int index) => tapItem(index),
            )));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
