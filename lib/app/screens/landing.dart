import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tfasoft_mobile/app/screens/authentication/authentication_screen.dart';
import 'package:tfasoft_mobile/app/screens/home/home_screen.dart';
import 'package:tfasoft_mobile/app/services/state.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    bool isLogin = Provider.of<AppState>(context, listen: true).getLogin;
    return isLogin ? const HomeScreen() : const AuthenticationScreen();
  }
}
