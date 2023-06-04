import 'package:flutter/material.dart';
import 'package:smart_education/pages/root/smart_education.dart';
import 'package:smart_education/pages/class/class_page.dart';
import 'package:smart_education/pages/mine_page.dart';
import 'package:smart_education/pages/timetable/timetable.dart';
import 'package:smart_education/util/constant.dart';

import '../timetable/timetable_settings.dart';
import '../../util/database/database_manager.dart';

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
    _TabItem(
        "班级", "assets/images/tab_today_unselected.png", "assets/images/tab_today_selected.png"),
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

    _pageList = [_timetablePage, ClassPage(), MinePage()];

    _tabItemList = _tabItemNameList
        .map((e) => BottomNavigationBarItem(
            icon: Image.asset(e.iconName),
            activeIcon: Image.asset(e.activeIconName),
            label: e.title))
        .toList();
  }

  void initDatabase() {
    // 打开数据库
    DatabaseManager().open("db_id").then((value) {
      // 装配课程表数据
      // 1.从数据库先获取数据，如果没有数据再插入数据；
    });
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
