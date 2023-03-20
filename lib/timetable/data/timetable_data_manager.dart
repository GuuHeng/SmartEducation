import 'package:smart_education/timetable/data/weekday_timetable_data.dart';
import 'package:smart_education/pages/timetable/weekday_timetable.dart';
import 'package:smart_education/models/subject_model.dart';
import 'package:smart_education/util/database/database_manager.dart';

class TimeTableDataManager {
  static final TimeTableDataManager dataManager = TimeTableDataManager();

  WeekdayTimeTableData weekdayTimeTableData = WeekdayTimeTableData();

  List<ClassSubjectUserData> currentDayList = <ClassSubjectUserData>[];
  List<Lesson> currentDayLessonTimeList = <Lesson>[];

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

    createSubjectsAndTeachersData();
  }

  void createData() {}

  void createSubjectsAndTeachersData() {
    List<String> subjectNameList = [
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
    List<String> teacherNameList = [
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

    List<Subject> subjectList = <Subject>[];
    List<Teacher> teacherList = <Teacher>[];

    for (int index = 0; index < subjectNameList.length; index++) {
      final subject = Subject('100${index}', subjectNameList[index]);
      final teacher = Teacher('200${index}', teacherNameList[index], subject);

      subjectList.add(subject);
      teacherList.add(teacher);
    }

    DatabaseManager().insertSubjects(subjectList);
    DatabaseManager().insertTeachers(teacherList);
  }
}
