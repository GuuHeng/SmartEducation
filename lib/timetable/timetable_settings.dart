import 'package:flutter/material.dart';

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
  static const _menusTitles = ["课表管理", "更多设置"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return settingsDrawer();
  }

  Widget settingsDrawer() {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(
            "离散",
            style: TextStyle(fontSize: 20),
          ),
          accountEmail: Text("高级教师"),
          currentAccountPicture: CircleAvatar(
            child: Icon(Icons.man),
          ),
          onDetailsPressed: () {
            
          },
          decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: AssetImage('assets/images/school.png'), fit: BoxFit.cover)),
        ),
        ListTile(
          leading: Icon(Icons.local_activity),
          title: Text("课表管理"),
        ),
        Divider(),
        ListTile(leading: Icon(Icons.manage_history), title: Text("更多管理"))
      ],
    ));
  }
}
