import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tfasoft_mobile/app/screens/authentication/authentication_screen.dart';
import 'package:tfasoft_mobile/app/screens/home/home_screen.dart';

import 'package:tfasoft_mobile/app/services/api.dart';
import 'package:tfasoft_mobile/app/services/state.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final DioClient _client = DioClient();

  Future<void> getUser(BuildContext context, String uid) async {
    var response = _client.getUser(uid);

    response.then((result) {
      if (result.statusCode == 200) {
        Provider.of<AppState>(context, listen: false).setUser(result.data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLogin = Provider.of<AppState>(context, listen: true).getLogin;

    if (isLogin) getUser(context, Provider.of<AppState>(context, listen: true).getUid);

    return isLogin ? const HomeScreen() : const AuthenticationScreen();
  }
}
