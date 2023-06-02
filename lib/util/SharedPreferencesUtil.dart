import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreferencesUtil {
  static SharedPreferencesUtil? _instance;
  static SharedPreferences? _prefs;

  static Future<SharedPreferencesUtil> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferencesUtil();
      _prefs = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs!.setString(key, value);
  }

  String getString(String key) {
    return _prefs!.getString(key) ?? "";
  }

  Future<bool> setInt(String key, int value) async {
    return await _prefs!.setInt(key, value);
  }

  int getInt(String key) {
    return _prefs!.getInt(key) ?? 0;
  }

  Future<bool> setDouble(String key, double value) async {
    return await _prefs!.setDouble(key, value);
  }

  double getDouble(String key) {
    return _prefs!.getDouble(key) ?? 0;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs!.setBool(key, value);
  }

  bool getBool(String key) {
    return _prefs!.getBool(key) ?? false;
  }

  Future<bool> setMap(String key, Map<String, dynamic> value) async {
    String jsonValue = jsonEncode(value);
    return await _prefs!.setString(key, jsonValue);
  }

  Map<String, dynamic>? getMap(String key) {
    String? jsonValue = _prefs!.getString(key);
    if (jsonValue != null) {
      return jsonDecode(jsonValue);
    } else {
      return null;
    }
  }

  Future<bool> remove(String key) async {
    return await _prefs!.remove(key);
  }
}
