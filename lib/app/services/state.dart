import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _isLogin = false;
  String _uid = "";

  bool get getLogin {
    return _isLogin;
  }
  String get getUid {
    return _uid;
  }

  void login(String uid) {
    _isLogin = true;
    _uid = uid;
    notifyListeners();
  }
  void logout() {
    _isLogin = false;
    _uid = "";
    notifyListeners();
  }
}