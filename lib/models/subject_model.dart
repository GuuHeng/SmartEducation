import 'package:json_annotation/json_annotation.dart';

part 'subject_model.g.dart';

class ClassSubjectUserData {
  ClassSubject classSubject;
  List<ClassSubjectPayAttention>? payAttentionList;
  String event = "";
  bool isHighlighted = false;

  ClassSubjectUserData(this.classSubject);
}

// 该节课的注意事项（人物、事件）
class ClassSubjectPayAttention {
  // 需要关注的目标，可以无目标
  Student? student;
  // 需要注意什么事
  String message = "";

  ClassSubjectPayAttention(this.message, this.student);
}

// 该节课的上课老师，上课科目
class ClassSubject {
  Teacher teacher;
  Subject subject;

  ClassSubject(this.teacher, this.subject);
}

// 科目
@JsonSerializable()
class Subject {
  String id;
  String name;
  // 可以用于UI上标记科目背景色
  int? color;

  Subject(this.id, this.name);

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
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

// 课堂时间
class Lesson {
  String beginTime;
  String endTime;

  Lesson(this.beginTime, this.endTime);
}
