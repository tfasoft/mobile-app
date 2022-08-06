import 'package:flutter/material.dart';

import 'package:tfasoft_mobile/app/screens/authentication/authentication_screen.dart';
import 'package:tfasoft_mobile/app/screens/home/home_screen.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return isLogin ? const HomeScreen() : const AuthenticationScreen();
  }
}
