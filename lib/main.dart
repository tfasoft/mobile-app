import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:tfasoft_mobile/app/screens/landing.dart';
import 'package:tfasoft_mobile/app/services/state.dart';

late Box box;

Future<void> main() async {
  await Hive.initFlutter();
  box = await Hive.openBox('box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scaffoldkey = GlobalKey<ScaffoldMessengerState>();

    return ChangeNotifierProvider<AppState>(
      create: (context) => AppState(),
      child: MaterialApp(
        scaffoldMessengerKey: _scaffoldkey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          // useMaterial3: true,
        ),
        home: const Landing(),
      ),
    );
  }
}