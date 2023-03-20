import 'package:flutter/material.dart';
import 'package:smart_education/home/smart_education.dart';
import 'package:smart_education/pages/mine_page.dart';
import 'package:smart_education/pages/timetable/timetable.dart';
import 'package:smart_education/util/constant.dart';

import '../pages/timetable/timetable_settings.dart';

class SmartEducation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SmartEducationState();
  }
}

// 因为使用的是tabbar->[page-nav],page自己的appbar中开启drawer无法覆盖tabbar，改用事件传递到这里去开启drawer，需要设置全局Scaffold;
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

class _SmartEducationState extends State<SmartEducation> with TickerProviderStateMixin {
  final _tabItemNameList = [
    _TabItem(
        "首页", "assets/images/tab_today_unselected.png", "assets/images/tab_today_selected.png"),
    _TabItem("我的", "assets/images/tab_me_unselected.png", "assets/images/tab_me_selected.png")
  ];

  // final _pageList = [TimeTable(), MinePage()];
  late List<Widget> _pageList;
  late List<BottomNavigationBarItem> _tabItemList;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    TimeTable _timetablePage = TimeTable();
    _timetablePage.onTapLeadingCallback = () {
      _scaffoldKey.currentState!.openDrawer();
    };

    _pageList = [_timetablePage, MinePage()];

    _tabItemList = _tabItemNameList
        .map((e) => BottomNavigationBarItem(
            icon: Image.asset(e.iconName),
            activeIcon: Image.asset(e.activeIconName),
            label: e.title))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(),
      drawer: TimeTableSettings(),
      body: _pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _tabItemList,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        unselectedLabelStyle:
            TextStyle(color: Color(AppColor.tab_item_unselected_color), fontSize: 10),
        selectedLabelStyle: TextStyle(color: Color(AppColor.tab_item_selected_color), fontSize: 10),
      ),
    );
  }
}

class _TabItem {
  String title, iconName, activeIconName;
  _TabItem(this.title, this.iconName, this.activeIconName);
}
