import 'package:flutter/material.dart';
import 'package:smart_education/models/subject_model.dart';
import 'package:smart_education/timetable/data/weekday_timetable_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path_provider/path_provider.dart';

const String subjects_table = "subjects";
const String teachers_table = "teachers";
const String students_table = "students";

class DatabaseManager {
  factory DatabaseManager() => _databaseManager();

  static DatabaseManager? _instance;

  DatabaseManager._() {}

  static DatabaseManager _databaseManager() {
    if (_instance == null) {
      _instance = DatabaseManager._();
    }
    return _instance!;
  }

  Database? db;
  static const databaseName = 'education.db';

  open(String db_id) async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + '/${databaseName}/${db_id}';

    try {
      db = await openDatabase(path, version: 1, onCreate: (db, version) async {
        db.execute(createSubjectTableSQL());
        db.execute(createTeacherTableSQL());
      }, onOpen: (db) async {
        print('onOpen database');
      });
    } catch (e) {
      print(e);
    }
  }

  Future close() async {
    await db?.close();
  }
}

extension TeacherDatabase on DatabaseManager {
  String createTeacherTableSQL() {
    String subjectTableSQL =
        'CREATE TABLE IF NOT EXISTS ${teachers_table} (id TEXT PRIMARY KEY, name TEXT, subjectId TEXT)';
    return subjectTableSQL;
  }

  Future insertTeachers(List<Teacher> teacherList) async {
    String insertSQL = 'replace into ${teachers_table} (id, name, subjectId) values (?, ?, ?)';
    await db?.transaction((txn) async {
      for (var model in teacherList) {
        txn.rawInsert(insertSQL, [model.id, model.name, model.subject?.id]);
      }
    });
  }

  Future deleteTeachers(List<String> teacherList) async {
    String deleteSQL = 'delete from ${teachers_table} where id = ?';
    await db?.transaction((txn) async {
      for (var id in teacherList) {
        txn.rawDelete(deleteSQL, [id]);
      }
    });
  }

  Future updateTeacher(String teacherId, Teacher teacher) async {
    String updateSQL = 'update ${teachers_table} set id = ? where id = ?';
    int? count = await db?.rawUpdate(updateSQL, [teacher.id, teacherId]);
  }

  Future<List<Map<String, Object?>>?> queryAllTeachers() async {
    String querySQL = 'select * from ${teachers_table}';
    List<Map<String, Object?>>? list = await db?.rawQuery(querySQL);
    return list;
  }

  Future<Map?> queryTeacher(String id) async {
    String querySQL = 'select * from ${teachers_table} where id = ? limit 1';
    List<Map>? list = await db?.rawQuery(querySQL, [id]);
    return list?.first;
  }
}

extension StudentDatabase on DatabaseManager {
  /*
  String createTeacherTableSQL() {
    String subjectTableSQL =
        'CREATE TABLE IF NOT EXISTS ${teachers_table} (id TEXT PRIMARY KEY, name TEXT, subjectId TEXT)';
    return subjectTableSQL;
  }

  Future insertTeachers(List<Teacher> teacherList) async {
    String insertSQL = 'replace into ${teachers_table} (id, name, subjectId) values (?, ?, ?)';
    await db?.transaction((txn) async {
      for (var model in teacherList) {
        txn.rawInsert(insertSQL, [model.id, model.name, model.subject?.id]);
      }
    });
  }

  Future deleteTeachers(List<String> teacherList) async {
    String deleteSQL = 'delete from ${teachers_table} where id = ?';
    await db?.transaction((txn) async {
      for (var id in teacherList) {
        txn.rawDelete(deleteSQL, [id]);
      }
    });
  }

  Future updateTeacher(String teacherId, Teacher teacher) async {
    String updateSQL = 'update ${teachers_table} set id = ? where id = ?';
    int? count = await db?.rawUpdate(updateSQL, [teacher.id, teacherId]);
  }

  Future<List<Map<String, Object?>>?> queryAllTeachers() async {
    String querySQL = 'select * from ${teachers_table}';
    List<Map<String, Object?>>? list = await db?.rawQuery(querySQL);
    return list;
  }

  Future<Map?> queryTeacher(String id) async {
    String querySQL = 'select * from ${teachers_table} where id = ? limit 1';
    List<Map>? list = await db?.rawQuery(querySQL, [id]);
    return list?.first;
  }
  */
}

extension SubjectDatabase on DatabaseManager {
  String createSubjectTableSQL() {
    String subjectTableSQL =
        'CREATE TABLE IF NOT EXISTS ${subjects_table} (id TEXT PRIMARY KEY, name TEXT)';
    return subjectTableSQL;
  }

  Future insertSubjects(List<Subject> subjectList) async {
    String insertSQL = 'replace into ${subjects_table} (id, name) values (?, ?)';
    await db?.transaction((txn) async {
      for (var subject in subjectList) {
        txn.rawInsert(insertSQL, [subject.id, subject.name]);
      }
    });
  }

  Future deleteSubjects(List<String> subjectIdList) async {
    String deleteSQL = 'delete from ${subjects_table} where id = ?';
    await db?.transaction((txn) async {
      for (var id in subjectIdList) {
        txn.rawDelete(deleteSQL, [id]);
      }
    });
  }

  Future updateSubject(String subjectId, int color) async {
    String updateSQL = 'update ${subjects_table} set color = ? where id = ?';
    int? count = await db?.rawUpdate(updateSQL, [color, subjectId]);
  }

  Future<List<Map<String, Object?>>?> queryAllSubjects() async {
    String querySQL = 'select * from ${subjects_table}';
    List<Map<String, Object?>>? list = await db?.rawQuery(querySQL);
    return list;
  }

  Future<Map?> querySubject(String id) async {
    String querySQL = 'select * from ${subjects_table} where id = ? limit 1';
    List<Map>? list = await db?.rawQuery(querySQL, [id]);
    return list?.first;
  }
}

extension ColorDatabase on DatabaseManager {}

extension PayAttentionDatabase on DatabaseManager {}
