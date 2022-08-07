import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _isLogin = false;
  String _uid = "";
  Map _user = {};

  bool get getLogin {
    return _isLogin;
  }
  String get getUid {
    return _uid;
  }
  Map get getUser {
    return _user;
  }

  void login(String uid) {
    _isLogin = true;
    _uid = uid;
    notifyListeners();
  }
  void logout() {
    _isLogin = false;
    _uid = "";
    _user = {};
    notifyListeners();
  }

  void setUser(Map user) {
    _user = user;
    notifyListeners();
  }
}