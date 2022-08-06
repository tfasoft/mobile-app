import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _isLogin = false;

  bool get getLogin {
    return _isLogin;
  }

  void login() {
    _isLogin = true;
  }
  void logout() {
    _isLogin = false;
  }
}