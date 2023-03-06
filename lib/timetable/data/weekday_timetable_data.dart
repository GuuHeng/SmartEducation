import 'dart:math';
import 'package:time/time.dart';

class WeekdayTimeTableData {
  List<String> subjects = ["语文", "数学", "外语", "物理", "化学", "生物", "地理", "政治", "历史", "体育", "音乐"];

  List<String> teachers = ["赵一", "钱二", "张三", "李四", "王五", "孙六", "李七", "周八", "吴九", "郑十", "默默"];

  // 一天上课的默认起始时间
  String defaultMorningBeginTime = "08:00";
  String defaultAfternoonBeginTime = "14:00";
  String defaultEveningBeginTime = "18:00";

  // 一节课的时长，默认是40分钟
  int lessonDuratiion = 45;
  int morningLessonCount = 4;
  int afternoonLessonCount = 3;
  int eveningLessonCount = 3;

  // 课间休息时间，默认是10分钟
  int recessDuration = 10;

  List<Lesson>? morningLessonList;
  List<Lesson>? afternoonLessonList;
  List<Lesson>? eveningLessonList;

  // 所有科目的上课时间
  List<Lesson> get_today_total_lesson_times() {
    List<Lesson> lessonList = <Lesson>[];

    List<Lesson> morningList =
        get_lesson_times(defaultMorningBeginTime, lessonDuratiion, morningLessonCount);
    List<Lesson> afternoonList =
        get_lesson_times(defaultAfternoonBeginTime, lessonDuratiion, afternoonLessonCount);
    List<Lesson> eveningList =
        get_lesson_times(defaultEveningBeginTime, lessonDuratiion, eveningLessonCount);

    morningLessonList = morningList;
    afternoonLessonList = afternoonList;
    eveningLessonList = eveningList;

    lessonList.addAll(morningList);
    lessonList.addAll(afternoonList);
    lessonList.addAll(eveningList);

    return lessonList;
  }

  // 计算指定时间段的上课时间
  List<Lesson> get_lesson_times(String beginHM, int duration, int count) {
    List<Lesson> lessonList = <Lesson>[];

    DateTime nowTime = DateTime.now();
    List<String> hmList = beginHM.split(":");

    DateTime beginDateTime = DateTime(nowTime.year, nowTime.month, nowTime.day,
        int.parse(hmList.first), int.parse(hmList.last), 0);

    for (int index = 0; index < count; index++) {
      DateTime endDateTime = beginDateTime + duration.minutes;

      String beginDateTimeText = beginDateTime.toString().split(" ").last.substring(0, 5);
      String endDateTimeText = endDateTime.toString().split(" ").last.substring(0, 5);
      Lesson lesson = Lesson(beginDateTimeText, endDateTimeText);

      lessonList.add(lesson);
      beginDateTime = endDateTime + 10.minutes;
    }

    return lessonList;
  }

  // List<Teacher> _teacherList = <Teacher>[];
  // List<Subject> _subjectList = <Subject>[];
  List<ClassSubject> _classSubjectList = <ClassSubject>[];

  List<ClassSubject> get_classSubject_data() {
    for (int index = 0; index < this.subjects.length; index++) {
      String subjectName = this.subjects[index];
      String teacherName = this.teachers[index];

      String subjectId = (1000 + index).toString();
      String teacherId = (2000 + index).toString();

      Subject subject = Subject(subjectId, subjectName);
      Teacher teacher = Teacher(teacherId, teacherName, subject);

      ClassSubject classSubject = ClassSubject(teacher, subject);

      // _subjectList.add(subject);
      // _teacherList.add(teacher);
      _classSubjectList.add(classSubject);
    }

    return _classSubjectList;
  }

  List<ClassSubject> weekday_classSubjectList = <ClassSubject>[];

  // 假设七天都有课，每天上午四节课，下午三节课，晚上三节课，总共十节课；
  List<ClassSubject> get_weekday_classSubject_data() {
    this._classSubjectList = get_classSubject_data();

    final int totalCount = 70;
    final int classSubjectCount = this._classSubjectList.length;

    var range = Random();
    var list = <ClassSubject>[];

    for (int index = 0; index < totalCount; index++) {
      int randomIndex = range.nextInt(classSubjectCount);
      ClassSubject cs = this._classSubjectList[randomIndex];
      list.add(cs);
    }

    return list;
  }

  // 假设七天都有课，每天上午四节课，下午三节课，晚上三节课，总共十节课；
  List<ClassSubjectUserData> get_weekday_classSubject_userdata() {
    this._classSubjectList = get_classSubject_data();

    final int totalCount = 70;
    final int classSubjectCount = this._classSubjectList.length;

    var range = Random();
    var list = <ClassSubjectUserData>[];

    for (int index = 0; index < totalCount; index++) {
      int randomIndex = range.nextInt(classSubjectCount);
      ClassSubject cs = this._classSubjectList[randomIndex];
      ClassSubjectUserData userData = ClassSubjectUserData(cs);
      if (index % 10 == 0) {
        userData.event = "考试";
      }
      if (index == 11) {
        userData.payAttentionList = [ClassSubjectPayAttention("大扫除", null)];
      }

      if (index == 22) {
        userData.payAttentionList = [
          ClassSubjectPayAttention("请假了", Student("id", "安迪")),
          ClassSubjectPayAttention("请假了", Student("id", "李白"))
        ];
      }

      if (index % 7 == 5) {
        userData.payAttentionList = [ClassSubjectPayAttention("校运动会", null)];
      }

      if (index == 55) {
        userData.payAttentionList = [ClassSubjectPayAttention("参加作文比赛去了", Student("id", "李白"))];
      }

      list.add(userData);
    }
    allCSUserDataList = list;
    return list;
  }

  List<ClassSubjectUserData> allCSUserDataList = <ClassSubjectUserData>[];
}

class ClassSubjectUserData {
  ClassSubject classSubject;
  List<ClassSubjectPayAttention>? payAttentionList;
  String event = "";
  bool isHighlighted = false;

  ClassSubjectUserData(this.classSubject);
}

class ClassSubjectPayAttention {
  // 需要关注的目标，可以无目标
  Student? student;
  // 需要注意什么事
  String message = "";

  ClassSubjectPayAttention(this.message, this.student);
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

// 学生
class Student {
  String id;
  String name;

  Student(this.id, this.name);
}

class Lesson {
  String beginTime;
  String endTime;

  Lesson(this.beginTime, this.endTime);
}
