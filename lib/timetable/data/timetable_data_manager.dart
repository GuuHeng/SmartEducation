import 'package:smart_education/timetable/data/mock_data.dart';
import 'package:smart_education/timetable/data/weekday_timetable_data.dart';
import 'package:smart_education/pages/timetable/weekday_timetable.dart';
import 'package:smart_education/models/subject_model.dart';
import 'package:smart_education/util/database/database_manager.dart';

class TimeTableDataManager {
  final List<String> subjectNameList = [
    "语文",
    "数学",
    "外语",
    "物理",
    "化学",
    "生物",
    "地理",
    "政治",
    "历史",
    "体育",
    "音乐"
  ];

  final List<String> teacherNameList = [
    "赵一",
    "钱二",
    "张三",
    "李四",
    "王五",
    "孙六",
    "李七",
    "周八",
    "吴九",
    "郑十",
    "默默"
  ];

  // static final TimeTableDataManager dataManager = TimeTableDataManager();

  factory TimeTableDataManager() => _dataManager();
  static TimeTableDataManager? _instance;
  TimeTableDataManager._() {}

  static TimeTableDataManager _dataManager() {
    if (_instance == null) {
      _instance = TimeTableDataManager._();
    }
    return _instance!;
  }

  MockData _mockData = MockData();

  // 周课表
  // 今日课表
  // 所有老师
  // 所有学生
  // 所有科目

  WeekdayTimeTableData weekdayTimeTableData = WeekdayTimeTableData();

  List<ClassSubjectUserData> currentDayList = <ClassSubjectUserData>[];
  List<Lesson> currentDayLessonTimeList = <Lesson>[];

  // 获取今日的课表数据
  void get_today_timetable_data() {
    List<ClassSubjectUserData> list = weekdayTimeTableData.get_weekday_classSubject_userdata();

    List<ClassSubjectUserData> todayList = <ClassSubjectUserData>[];

    for (int index = 0; index < list.length; index++) {
      if (index % 7 == 1) {
        todayList.add(list[index]);
      }
    }

    currentDayList = todayList;

    currentDayLessonTimeList = weekdayTimeTableData.get_today_total_lesson_times();
  }

  late List<Subject> subjects;
  late List<Teacher> teachers;

  Future setup() async {
    subjects = await _mockData.mockApi_getAllSubjects();
    teachers = await _mockData.mockApi_getAllTeachers();
    await DatabaseManager().insertSubjects(subjects);
    await DatabaseManager().insertTeachers(teachers);
  }
}
