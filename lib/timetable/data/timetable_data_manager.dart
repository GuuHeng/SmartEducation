import 'package:smart_education/timetable/data/weekday_timetable_data.dart';
import 'package:smart_education/timetable/weekday_timetable.dart';

class TimeTableDataManager {
  static final TimeTableDataManager _dataManager = TimeTableDataManager();

  WeekdayTimeTableData weekdayTimeTableData = WeekdayTimeTableData();

  WeekdayTimeTableData get_weekday_timetable_data() {
    List<ClassSubjectUserData> list = weekdayTimeTableData.get_weekday_classSubject_userdata();
    return weekdayTimeTableData;
  }
}