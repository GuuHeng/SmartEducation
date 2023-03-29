import 'package:smart_education/models/subject_model.dart';

class MockData {
  Future<List<Teacher>> mockApi_getAllTeachers() {
    return Future.delayed(Duration(seconds: 3), () {
      return getAllTeachersData();
    });
  }

  Future<List<Subject>> mockApi_getAllSubjects() {
    return Future.delayed(Duration(seconds: 3), () {
      return getAllSubjectsData();
    });
  }

  /////////////////////////////////////////////////////////////
  List<Subject> getAllSubjectsData() {
    List<Subject> subjectList = <Subject>[];

    for (int index = 0; index < subjectNameList.length; index++) {
      final subject = Subject('100${index}', subjectNameList[index]);

      subjectList.add(subject);
    }

    return subjectList;
  }

  Future<List<Teacher>> getAllTeachersData() async {
    List<Teacher> teacherList = <Teacher>[];

    List<Subject> subjectList = await getAllSubjectsData();

    for (int index = 0; index < teacherNameList.length; index++) {
      final subject = subjectList[index];
      final teacher = Teacher('200${index}', teacherNameList[index], subject);

      teacherList.add(teacher);
    }

    return teacherList;
  }
}

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
