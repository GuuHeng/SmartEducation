import 'package:flutter/material.dart';
import 'package:smart_education/router.dart';
import 'package:smart_education/util/constant.dart';

class TimeTableSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _TimeTableSettings();
  }
}

class _TimeTableSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TimeTableSettingsState();
  }
}

class _TimeTableSettingsState extends State<_TimeTableSettings> {
  late List<ListTile> _menusItemList;

  List<_SettingItem> menusList = [
    // _SettingItem("课表管理", "", SERouter.timetableManagementPage),
    _SettingItem("科目管理", "", SERouter.subjectManagementPage),
    // _SettingItem("更多管理", "", SERouter.timetableManagementPage)
  ];

  @override
  void initState() {
    super.initState();

    _menusItemList = menusList.map((e) {
      return ListTile(
        leading: Icon(Icons.manage_accounts),
        title: Text(e.name),
        onTap: () {
          SERouter.push(context, e.page);
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return settingsDrawer();
  }

  Widget settingsDrawer() {
    return Drawer(
        child: ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return UserAccountsDrawerHeader(
                  accountName: Text(
                    "离散",
                    style: TextStyle(fontSize: 20),
                  ),
                  accountEmail: Text("高级教师"),
                  currentAccountPicture: CircleAvatar(
                    child: Icon(Icons.man),
                  ),
                  onDetailsPressed: () {},
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage('assets/images/school.png'),
                          fit: BoxFit.cover)),
                );
              } else {
                for (int i = 0; i < _menusItemList.length; i++) {
                  return _menusItemList[index - 1];
                }
              }
              return Text("");
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
                  height: 1,
                  color: Color(AppColor.list_separated_color),
                ),
            itemCount: _menusItemList.length + 1));
  }
}

class _SettingItem {
  String name;
  String iconName;
  String page;
  _SettingItem(this.name, this.iconName, this.page);
}
