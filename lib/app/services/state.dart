import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _login = false;
  String _uid = "";
  Map _user = {};

  bool get getLogin {
    return _login;
  }
  String get getUid {
    return _uid;
  }
  Map get getUser {
    return _user;
  }

  Future<void> login(String uid) async {
    _login = true;
    _uid = uid;

    notifyListeners();
  }
  Future<void> logout() async {
    _login = false;
    _uid = "";
    _user = {};

    notifyListeners();
  }

  Future<void> setUser(Map user) async {
    _user = user;

    notifyListeners();
  }
}