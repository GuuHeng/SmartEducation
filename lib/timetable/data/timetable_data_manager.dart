import 'package:smart_education/timetable/data/weekday_timetable_data.dart';
import 'package:smart_education/timetable/weekday_timetable.dart';

class TimeTableDataManager {
  static final TimeTableDataManager dataManager = TimeTableDataManager();

  WeekdayTimeTableData weekdayTimeTableData = WeekdayTimeTableData();

  List<ClassSubjectUserData> currentDayList = <ClassSubjectUserData>[];
  List<Lesson> currentDayLessonTimeList = <Lesson>[];


  void get_today_timetable_data() {
    List<ClassSubjectUserData> list = weekdayTimeTableData.get_weekday_classSubject_userdata();

    List<ClassSubjectUserData> todayList = <ClassSubjectUserData>[];

    for (int index = 0; index < list.length; index ++) {
      if ([0, 7, 14, 21, 28, 35, 42, 49, 56, 63].contains(index)) {
        todayList.add(list[index]);
      }
    }

    currentDayList = todayList;

    currentDayLessonTimeList = weekdayTimeTableData.get_today_total_lesson_times();

  }
}