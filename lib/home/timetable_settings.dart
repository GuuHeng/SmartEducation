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
      child: Stack(
        children: [
          Expanded(
            child:
                // Image(image: AssetImage(""));
                Icon(Icons.abc),
          ),
          Expanded(
              child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.local_activity),
                title: Text("课表管理"),
              ),
              Divider(),
              ListTile(leading: Icon(Icons.manage_history), title: Text("更多管理"))
            ],
          ))
        ],
      ),
    );
  }
}
