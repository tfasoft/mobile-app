import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppDb {
  Future<void> setBool(String key, bool value) async {
    final SharedPreferences db = await SharedPreferences.getInstance();
    await db.setBool(key, value);
  }
  Future<void> setString(String key, String value) async {
    final SharedPreferences db = await SharedPreferences.getInstance();
    await db.setString(key, value);
  }
  Future<void> setInt(String key, int value) async {
    final SharedPreferences db = await SharedPreferences.getInstance();
    await db.setInt(key, value);
  }
  Future<void> setMap(String key, Map value) async {
    final SharedPreferences db = await SharedPreferences.getInstance();
    await db.setString(key, json.encode(value));
  }

  Future<bool?> getBool(String key) async {
    final SharedPreferences db = await SharedPreferences.getInstance();
    return db.getBool(key);
  }
  Future<String?> getString(String key) async {
    final SharedPreferences db = await SharedPreferences.getInstance();
    return db.getString(key);
  }
  Future<int?> getInt(String key) async {
    final SharedPreferences db = await SharedPreferences.getInstance();
    return db.getInt(key);
  }
  Future<Map?> getMap(String key) async {
    final SharedPreferences db = await SharedPreferences.getInstance();
    String? coming = db.getString(key);
    return json.decode(coming!);
  }
}