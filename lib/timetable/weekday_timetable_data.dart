import 'dart:math';

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
  Teacher? teacher;
  Subject? subject;

  ClassSubject(this.teacher, this.subject);
}

// 科目
class Subject {
  String? id;
  String? name;

  Subject(this.id, this.name);
}

// 上课老师
class Teacher {
  String? id;
  String? name;
  Subject? subject;

  Teacher(this.id, this.name, this.subject);
}
