import 'dart:math';
import 'package:time/time.dart';

class WeekdayTimeTableData {

  List subjects = [
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

  List teachers = [
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

  // 一天上课的默认起始时间
  String defaultMorningBeginTime = "08:00";
  String defaultAfternoonBeginTime = "14:00";
  String defaultEveningBeginTime = "18:00";

  // 一节课的时长，默认是40分钟
  int lessonDuratiion = 40;
  int morningLessonCount = 4;
  int afternoonLessonCount = 3;
  int eveningLessonCount = 3;

  // 课间休息时间，默认是10分钟
  int recessDuration = 10;

  
  List<Lesson> get_today_total_lesson_times() {

    List<Lesson> lessonList = <Lesson>[];

    lessonList.addAll(get_lesson_times(defaultMorningBeginTime, lessonDuratiion, morningLessonCount));
    lessonList.addAll(get_lesson_times(defaultAfternoonBeginTime, lessonDuratiion, afternoonLessonCount));
    lessonList.addAll(get_lesson_times(defaultEveningBeginTime, lessonDuratiion, eveningLessonCount));

    return lessonList;
  }

  List<Lesson> get_lesson_times(String beginHM, int duration, int count) {
    List<Lesson> lessonList = <Lesson>[];

    DateTime nowTime = DateTime.now();
    List<String> hmList = beginHM.split(":");

    DateTime beginDateTime = DateTime(nowTime.year, nowTime.month, nowTime.day, int.parse(hmList.first), int.parse(hmList.last), 0);

    for (int index = 0; index < count; index ++) {
      DateTime endDateTime = beginDateTime + duration.minutes;

      // List<String> beginhms = beginDateTime.toString().split(" ").last.split(":");
      // List<String> endhms = endDateTime.toString().split(" ").last.split(":");
      // String beginDateTimeText = beginDateTime.hour.toString() + ":" + beginDateTime.minute.toString();
      // String endDateTimeText = endDateTime.hour.toString() + ":" + endDateTime.minute.toString();

      String beginDateTimeText = beginDateTime.toString().split(" ").last.substring(0, 5);
      String endDateTimeText = endDateTime.toString().split(" ").last.substring(0, 5);
      Lesson lesson = Lesson(beginDateTimeText, endDateTimeText);

      lessonList.add(lesson);

      beginDateTime = endDateTime + 10.minutes;
    }

    return lessonList;
  }


  List<Teacher> teacherList = <Teacher>[];
  List<Subject> subjectList = <Subject>[];
  List<ClassSubject> classSubjectList = <ClassSubject>[];

  List<ClassSubject> get_classSubject_data() {
    for (int index = 0; index < this.subjects.length; index++) {
      String subjectName = this.subjects[index];
      String teacherName = this.teachers[index];

      String subjectId = (1000 + index).toString();
      String teacherId = (2000 + index).toString();

      Subject subject = Subject(subjectId, subjectName);
      Teacher teacher = Teacher(teacherId, teacherName, subject);

      ClassSubject classSubject = ClassSubject(teacher, subject);

      subjectList.add(subject);
      teacherList.add(teacher);
      classSubjectList.add(classSubject);
    }

    return classSubjectList;
  }

  List<ClassSubject> weekday_classSubjectList = <ClassSubject>[];

  // 假设七天都有课，每天上午四节课，下午三节课，晚上三节课，总共十节课；
  List<ClassSubject> get_weekday_classSubject_data() {

    this.classSubjectList = get_classSubject_data();

    final int totalCount = 70;
    final int classSubjectCount = this.classSubjectList.length;

    var range = Random();
    var list = <ClassSubject>[];

    for (int index = 0; index < totalCount; index ++) {
      int randomIndex = range.nextInt(classSubjectCount);
      ClassSubject cs = this.classSubjectList[randomIndex];
      list.add(cs);
    }

    return list;
  }

}

class ClassSubject {
  Teacher teacher;
  Subject subject;

  ClassSubject(this.teacher, this.subject);
}

// 科目
class Subject {
  String id;
  String name;

  Subject(this.id, this.name);
}

// 上课老师
class Teacher {
  String? id;
  String? name;
  Subject? subject;

  Teacher(this.id, this.name, this.subject);
}

class Lesson {
  String beginTime;
  String endTime;

  Lesson(this.beginTime, this.endTime);
}