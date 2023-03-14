import 'package:flutter/material.dart';
import 'package:smart_education/models/subject_model.dart';
import 'package:smart_education/timetable/data/weekday_timetable_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path_provider/path_provider.dart';

const String subjects_table = "subjects";

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
      db = await openDatabase(path, version: 1, onCreate: (db, version) {
        String subjectTableSQL =
            'CREATE TABLE IF NOT EXISTS ${subjects_table} (id TEXT PRIMARY KEY, name TEXT)';
        db.execute(subjectTableSQL);
      });
    } catch (e) {}
  }

  Future close() async {
    await db?.close();
  }

  Future insert(List<Subject> subjectList) async {
    String insertSQL = 'replace into ${subjects_table} (id, name) values (?, ?)';
    await db?.transaction((txn) async {
      for (var subject in subjectList) {
        txn.rawInsert(insertSQL, [subject.id, subject.name]);
      }
    });
  }

  Future delete(List<String> subjectIdList) async {
    String deleteSQL = 'delete from ${subjects_table} where id = ?';
    await db?.transaction((txn) async {
      for (var id in subjectIdList) {
        txn.rawDelete(deleteSQL, [id]);
      }
    });
  }

  Future update(String subjectId, int color) async {
    String updateSQL = 'update ${subjects_table} set color = ? where id = ?';
    int? count = await db?.rawUpdate(updateSQL, [color, subjectId]);
  }

  Future<List<Map<String, Object?>>?> query() async {
    String querySQL = 'select * from ${subjects_table}';
    List<Map<String, Object?>>? list = await db?.rawQuery(querySQL);
    return list;
  }

  Future querySubject(String subjectId) async {
    String querySQL = 'select * from ${subjects_table} where id = ? limit 1';
    List<Map>? list = await db?.rawQuery(querySQL, [subjectId]);
    return list;
  }
}
